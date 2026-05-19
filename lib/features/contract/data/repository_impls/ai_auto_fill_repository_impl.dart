import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/services/image_filter_service.dart';
import 'package:trana/features/contract/domain/entities/ai_auto_fill_entity.dart';
import 'package:trana/features/contract/domain/repositories/ai_auto_fill_repository.dart';

class AiAutoFillRepositoryImpl implements AiAutoFillRepository {
  AiAutoFillRepositoryImpl(this._filterService);

  final ImageFilterService _filterService;

  static const _apiHost = 'api.openai.com';
  static const _model = 'gpt-4o-mini';

  static const _prompt =
      '너는 C2C 안전 거래 플랫폼 Trana의 계약서 자동 완성(Auto-fill) 전문가야.\n'
      '제공된 중고 거래 게시글 스크린샷에서 계약에 필요한 핵심 정보를 정확하게 추출하여 JSON 형식으로 응답해야 해.\n'
      '{\n'
      '  "product_name": 상품명. 게시글의 제목을 그대로 추출해.\n'
      '  "price": 가격. 원 이나 콤마(,)를 제외한 숫자만 추출해 (정수형).\n'
      '  "condition_summary": 상품 상태. 플랫폼에서 지정한 상태 키워드(예: 사용감 적음, 미개봉 등)를 추출해.\n'
      '  "condition_details": 상품 상세 설명. 상세 설명 글에서 언급된 하자(찍힘, 스크래치 등)나 사용 기간, 작동 여부 등을 핵심만 요약해.\n'
      '}\n';

  @override
  Future<Result<AiAutoFillEntity>> analyzeImages(List<XFile> images) async {
    try {
      final apiKey = dotenv.env['OPENAI_API_KEY'] ?? '';
      if (apiKey.isEmpty) {
        return const Failure(NetworkFailure('OPENAI_API_KEY 를 확인해주세요.'));
      }

      // 텍스트 키워드 기반 상위 2개 이미지 선별 + 압축
      // 필터링 결과가 없으면 원본 이미지 그대로 사용
      final filtered = await _filterService.extractBestImages(images);
      final toAnalyze = filtered.isEmpty ? images : filtered;

      // 이미지 > content parts (base64 URL 형식)
      final contentParts = <Map<String, dynamic>>[];
      for (final image in toAnalyze) {
        final bytes = await image.readAsBytes();
        final mime = _mimeType(image.path);
        contentParts.add({
          'type': 'image_url',
          'image_url': {'url': 'data:$mime;base64,${base64Encode(bytes)}'},
        });
      }
      contentParts.add({'type': 'text', 'text': _prompt});

      final requestBody = jsonEncode({
        'model': _model,
        'messages': [
          {'role': 'user', 'content': contentParts},
        ],
        'response_format': {'type': 'json_object'},
        'temperature': 0.1,
        'max_tokens': 512,
      });

      final client = HttpClient()
        ..connectionTimeout = const Duration(seconds: 30);
      final request = await client.postUrl(
        Uri.https(_apiHost, '/v1/chat/completions'),
      );
      request.headers
        ..set(HttpHeaders.contentTypeHeader, 'application/json; charset=utf-8')
        ..set(HttpHeaders.authorizationHeader, 'Bearer $apiKey');
      request.add(utf8.encode(requestBody));

      final response = await request.close();
      final responseStr = await response.transform(const Utf8Decoder()).join();
      client.close();

      if (response.statusCode != 200) {
        return Failure(ServerFailure('GPT API 오류 (${response.statusCode})'));
      }

      return _parse(responseStr);
    } on SocketException {
      return const Failure(NetworkFailure('네트워크 연결을 확인해주세요.'));
    } catch (e) {
      return Failure(NetworkFailure('AI 분석 실패: $e'));
    }
  }

  Result<AiAutoFillEntity> _parse(String responseStr) {
    try {
      final json = jsonDecode(responseStr) as Map<String, dynamic>;
      final content = json['choices'][0]['message']['content'] as String;
      final data = jsonDecode(content) as Map<String, dynamic>;

      final rawPrice = data['price'];
      final amount = rawPrice is num
          ? rawPrice.toInt()
          : int.tryParse(
                  rawPrice?.toString().replaceAll(RegExp(r'[^\d]'), '') ?? '0',
                ) ??
                0;

      return Success(
        AiAutoFillEntity(
          productName: (data['product_name'] as String?)?.trim() ?? '(상품명 미확인)',
          amount: amount,
          conditionSummary: data['condition_summary'] as String?,
          conditionDetails: data['condition_details'] as String?,
        ),
      );
    } catch (e) {
      return Failure(ServerFailure('AI 응답 파싱 실패: $e'));
    }
  }

  String _mimeType(String path) {
    final lower = path.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.heic') || lower.endsWith('.heif')) {
      return 'image/heic';
    }
    return 'image/jpeg';
  }
}
