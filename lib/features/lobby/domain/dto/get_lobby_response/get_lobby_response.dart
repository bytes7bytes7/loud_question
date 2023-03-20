import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/utils.dart';
import '../../../../common/domain/domain.dart';

part 'get_lobby_response.g.dart';

@JsonSerializable()
class GetLobbyResponse {
  const GetLobbyResponse({
    required this.lobby,
  });

  final Lobby lobby;

  factory GetLobbyResponse.fromJson(JsonMap json) =>
      _$GetLobbyResponseFromJson(json);

  JsonMap toJson() => _$GetLobbyResponseToJson(this);
}
