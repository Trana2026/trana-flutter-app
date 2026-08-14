import 'package:dio/dio.dart';
import 'package:trana/features/profile/data/dtos/block_dto.dart';
import 'package:trana/features/profile/data/dtos/blocked_user_dto.dart';

class BlockDataSource {
  const BlockDataSource(this.dio);

  final Dio dio;

  /// POST 계약 상대방 차단
  Future<BlockDto> blockContractCounterpart(String publicCode) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/v1/contracts/$publicCode/block',
    );
    return BlockDto.fromJson(response.data!);
  }

  /// GET 내가 차단한 사용자 목록
  Future<List<BlockedUserDto>> getBlocks() async {
    final response = await dio.get<List<dynamic>>('/v1/blocks');
    return (response.data ?? [])
        .map((e) => BlockedUserDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// DELETE 차단 해제
  Future<void> unblock(String shareCode) async {
    await dio.delete<void>('/v1/blocks/$shareCode');
  }
}
