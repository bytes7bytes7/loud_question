import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';

part 'create_lobby_request.g.dart';

@JsonSerializable()
class CreateLobbyRequest {
  const CreateLobbyRequest({
    required this.password,
  });

  final String password;

  factory CreateLobbyRequest.fromJson(JsonMap json) =>
      _$CreateLobbyRequestFromJson(json);

  JsonMap toJson() => _$CreateLobbyRequestToJson(this);
}
