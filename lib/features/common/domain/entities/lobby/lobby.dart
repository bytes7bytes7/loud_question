import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../../../../common/domain/domain.dart';

part 'lobby.freezed.dart';

part 'lobby.g.dart';

@freezed
class Lobby with _$Lobby {
  const factory Lobby({
    required LobbyID id,
    required UserID creatorID,
    required int createdAtInMSSinceEpoch,
    required List<UserID> guestIDs,
  }) = _Lobby;

  factory Lobby.fromJson(JsonMap json) => _$LobbyFromJson(json);
}
