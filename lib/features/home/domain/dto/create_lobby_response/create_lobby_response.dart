import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../../../../common/domain/domain.dart';

part 'create_lobby_response.g.dart';

@JsonSerializable()
class CreateLobbyResponse {
  const CreateLobbyResponse({
    required this.lobby,
  });

  final Lobby lobby;

  factory CreateLobbyResponse.fromJson(JsonMap json) =>
      _$CreateLobbyResponseFromJson(json);

  JsonMap toJson() => _$CreateLobbyResponseToJson(this);
}
