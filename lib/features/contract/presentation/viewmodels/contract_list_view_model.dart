import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_status.dart';

part 'contract_list_view_model.g.dart';

@Riverpod(keepAlive: true)
class ContractListNotifier extends _$ContractListNotifier {
  @override
  List<ContractEntity> build() => [];

  void add(ContractEntity contract) {
    state = [...state, contract];
  }

  void updateStatus(String id, ContractStatus status) {
    state = [
      for (final c in state)
        if (c.id == id) c.copyWith(status: status) else c,
    ];
  }

  void remove(String id) {
    state = state.where((c) => c.id != id).toList();
  }
}
