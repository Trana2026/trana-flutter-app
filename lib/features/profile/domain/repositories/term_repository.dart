import 'package:trana/core/error/result.dart';
import 'package:trana/features/ekyc/domain/entities/terms_entity.dart';
import 'package:trana/features/profile/domain/enums/terms_type.dart';

abstract interface class TermRepository {
  Future<Result<TermsEntity>> readTermByType(TermsType type);
}
