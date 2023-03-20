import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_vm/user_vm.dart';

part 'lobby_info_vm.freezed.dart';

@freezed
class LobbyInfoVM with _$LobbyInfoVM {
  const factory LobbyInfoVM({
    required String id,
    required UserVM me,
    required UserVM creator,
    required int createdAtInMSSinceEpoch,
    required List<UserVM> guests,
  }) = _LobbyInfoVM;
}
