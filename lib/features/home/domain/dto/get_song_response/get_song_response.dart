import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';

part 'get_song_response.g.dart';

@JsonSerializable()
class GetSongResponse {
  const GetSongResponse({
    required this.bytes,
  });

  final List<int> bytes;

  factory GetSongResponse.fromJson(JsonMap json) =>
      _$GetSongResponseFromJson(json);

  JsonMap toJson() => _$GetSongResponseToJson(this);
}
