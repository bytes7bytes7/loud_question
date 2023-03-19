import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../../../../common/domain/domain.dart';

part 'get_lobbies_response.g.dart';

@JsonSerializable()
class GetLobbiesResponse {
  const GetLobbiesResponse({
    required this.lobbies,
  });

  final List<Lobby> lobbies;

  factory GetLobbiesResponse.fromJson(JsonMap json) =>
      _$GetLobbiesResponseFromJson(json);

  JsonMap toJson() => _$GetLobbiesResponseToJson(this);
}
