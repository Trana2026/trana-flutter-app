import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_inquiry_entity.freezed.dart';

@freezed
abstract class UserInquiryEntity with _$UserInquiryEntity {
  const factory UserInquiryEntity({
    required String publicCode,
    String? email,
    required String title,
    String? content,
    required DateTime createdAt,
  }) = _UserInquiryEntity;
}
