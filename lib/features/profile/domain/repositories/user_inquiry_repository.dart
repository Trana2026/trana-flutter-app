import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/user_inquiry_entity.dart';

abstract interface class UserInquiryRepository {
  Future<Result<List<UserInquiryEntity>>> readInquiries();

  Future<Result<UserInquiryEntity>> createInquiry({
    required String email,
    required String title,
    required String content,
  });

  Future<Result<UserInquiryEntity>> readInquiryDetail(String publicCode);
}
