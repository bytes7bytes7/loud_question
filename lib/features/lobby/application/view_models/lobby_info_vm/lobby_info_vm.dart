import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/domain/domain.dart';

part 'lobby_info_vm.freezed.dart';

@freezed
class LobbyInfoVM with _$LobbyInfoVM {
  const factory LobbyInfoVM({
    required String id,
    required User creator,
    required int createdAtInMSSinceEpoch,
    required List<User> guests,
  }) = _LobbyInfoVM;
}
