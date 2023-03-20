import 'package:freezed_annotation/freezed_annotation.dart';

part 'lobby_vm.freezed.dart';

@freezed
class LobbyVM with _$LobbyVM {
  const factory LobbyVM({
    required String id,
    required String creatorName,
    required int createdAtInMSSinceEpoch,
    required List<String> guestIDs,
  }) = _LobbyVM;
}
