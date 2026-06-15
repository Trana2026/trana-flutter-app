import 'package:dio/dio.dart';
import 'package:trana/features/contract/data/dtos/contract_attachment_dto.dart';
import 'package:trana/features/contract/data/dtos/contract_presign_dto.dart';

class ContractAttachmentDataSource {
  const ContractAttachmentDataSource(this.dio);

  final Dio dio;

  /// POST presigned PUT URL 발급
  Future<ContractPresignDto> presign({
    required String publicCode,
    required String contentType,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/attachments/presign',
      data: {'contentType': contentType},
    );
    return ContractPresignDto.fromJson(response.data!);
  }

  /// GET 첨부 사진 목록 조회
  Future<List<ContractAttachmentDto>> readAttachments(String publicCode) async {
    final response = await dio.get<List<dynamic>>(
      '/v1/contracts/$publicCode/attachments',
    );
    return (response.data ?? [])
        .map((e) => ContractAttachmentDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST 업로드 완료 후 메타 등록
  Future<ContractAttachmentDto> meta({
    required String publicCode,
    required String s3Key,
    required String originalFilename,
    required String contentType,
    required int sizeBytes,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/attachments',
      data: {
        's3Key': s3Key,
        'originalFilename': originalFilename,
        'contentType': contentType,
        'sizeBytes': sizeBytes,
      },
    );
    return ContractAttachmentDto.fromJson(response.data!);
  }

  /// DELETE 첨부 단건 삭제
  Future<void> deleteAttachment(String publicCode, int attachmentId) async {
    await dio.delete<void>(
      '/v1/contracts/$publicCode/attachments/$attachmentId',
    );
  }
}
