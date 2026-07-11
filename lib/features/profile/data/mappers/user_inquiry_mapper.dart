import 'package:trana/features/profile/data/dtos/user_inquiry_dto.dart';
import 'package:trana/features/profile/domain/entities/user_inquiry_entity.dart';

extension UserInquiryMapper on UserInquiryDto {
  UserInquiryEntity toEntity() {
    return UserInquiryEntity(
      publicCode: publicCode,
      email: email,
      title: title,
      content: content,
      createdAt: createdAt,
    );
  }
}
