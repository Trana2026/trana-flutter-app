import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trana/features/contract/data/repository_impls/fake/fake_ai_auto_fill_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/fake/fake_contract_parties_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/fake/fake_contract_requests_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/fake/fake_contracts_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/fake/fake_pdf_repository_impl.dart';
import 'package:trana/features/contract/data/repository_impls/fake/fake_product_photos_repository_impl.dart';
import 'package:trana/features/contract/data/services/image_filter_service.dart';
import 'package:trana/features/contract/domain/repositories/ai_auto_fill_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_parties_repository.dart';
import 'package:trana/features/contract/domain/repositories/contract_requests_repository.dart';
import 'package:trana/features/contract/domain/repositories/contracts_repository.dart';
import 'package:trana/features/contract/domain/repositories/pdf_repository.dart';
import 'package:trana/features/contract/domain/repositories/product_photos_repository.dart';

part 'provider.g.dart';

/// Supabase 클라이언트 Provider
final supabaseClientProvider = Provider<SupabaseClient>(
  (ref) => Supabase.instance.client,
);

// ==================== Repository ====================

@riverpod
AiAutoFillRepository aiAutoFillRepository(Ref ref) {
  final filterService = ImageFilterService();
  ref.onDispose(filterService.dispose);
  return FakeAiAutoFillRepositoryImpl(filterService);
}

@Riverpod(keepAlive: true)
ContractPartiesRepository contractPartiesRepository(Ref ref) {
  return FakeContractPartiesRepositoryImpl();
}

@Riverpod(keepAlive: true)
ContractRequestsRepository contractRequestsRepository(Ref ref) {
  return FakeContractRequestsRepositoryImpl();
}

@Riverpod(keepAlive: true)
ContractsRepository contractsRepository(Ref ref) {
  return FakeContractsRepositoryImpl();
}

@riverpod
PdfRepository pdfRepository(Ref ref) {
  return FakePdfRepositoryImpl();
}

@Riverpod(keepAlive: true)
ProductPhotosRepository productPhotosRepository(Ref ref) {
  return FakeProductPhotosRepositoryImpl();
}
