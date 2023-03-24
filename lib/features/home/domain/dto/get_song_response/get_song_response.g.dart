// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_song_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSongResponse _$GetSongResponseFromJson(Map<String, dynamic> json) =>
    GetSongResponse(
      bytes: (json['bytes'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$GetSongResponseToJson(GetSongResponse instance) =>
    <String, dynamic>{
      'bytes': instance.bytes,
    };
