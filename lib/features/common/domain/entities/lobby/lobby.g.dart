// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lobby.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lobby _$$_LobbyFromJson(Map<String, dynamic> json) => _$_Lobby(
      id: LobbyID.fromJson(json['id'] as Map<String, dynamic>),
      creatorID: UserID.fromJson(json['creatorID'] as Map<String, dynamic>),
      createdAtInMSSinceEpoch: json['createdAtInMSSinceEpoch'] as int,
      guestIDs: (json['guestIDs'] as List<dynamic>)
          .map((e) => UserID.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LobbyToJson(_$_Lobby instance) => <String, dynamic>{
      'id': instance.id,
      'creatorID': instance.creatorID,
      'createdAtInMSSinceEpoch': instance.createdAtInMSSinceEpoch,
      'guestIDs': instance.guestIDs,
    };
