import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../../../../common/domain/domain.dart';

part 'listen_lobby_response.g.dart';

@JsonSerializable()
class ListenLobbyResponse {
  const ListenLobbyResponse({
    required this.lobby,
  });

  final Lobby lobby;

  factory ListenLobbyResponse.fromJson(JsonMap json) =>
      _$ListenLobbyResponseFromJson(json);

  JsonMap toJson() => _$ListenLobbyResponseToJson(this);
}
