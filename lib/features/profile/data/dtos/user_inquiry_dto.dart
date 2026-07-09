import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_inquiry_dto.freezed.dart';
part 'user_inquiry_dto.g.dart';

@freezed
abstract class UserInquiryDto with _$UserInquiryDto {
  const factory UserInquiryDto({
    required String publicCode,
    String? email,
    required String title,
    String? content,
    required DateTime createdAt,
  }) = _UserInquiryDto;

  factory UserInquiryDto.fromJson(Map<String, dynamic> json) =>
      _$UserInquiryDtoFromJson(json);
}
