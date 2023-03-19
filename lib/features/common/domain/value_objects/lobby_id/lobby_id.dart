import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';

part 'lobby_id.freezed.dart';

part 'lobby_id.g.dart';

@freezed
class LobbyID with _$LobbyID {
  const factory LobbyID(String value) = _LobbyID;

  const LobbyID._();

  factory LobbyID.fromJson(JsonMap json) => _$LobbyIDFromJson(json);

  factory LobbyID.fromString(String string) => LobbyID(string);

  String get str => value;
}
