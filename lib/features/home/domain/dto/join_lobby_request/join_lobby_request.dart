import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';

part 'join_lobby_request.g.dart';

@JsonSerializable()
class JoinLobbyRequest {
  const JoinLobbyRequest({
    required this.password,
  });

  final String password;

  factory JoinLobbyRequest.fromJson(JsonMap json) =>
      _$JoinLobbyRequestFromJson(json);

  JsonMap toJson() => _$JoinLobbyRequestToJson(this);
}
