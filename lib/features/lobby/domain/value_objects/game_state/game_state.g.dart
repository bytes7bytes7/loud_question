// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitGameState _$$InitGameStateFromJson(Map<String, dynamic> json) =>
    _$InitGameState(
      lobbyID: LobbyID.fromJson(json['lobbyID'] as Map<String, dynamic>),
      leaderID: UserID.fromJson(json['leaderID'] as Map<String, dynamic>),
      readyIDs: (json['readyIDs'] as List<dynamic>)
          .map((e) => UserID.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$InitGameStateToJson(_$InitGameState instance) =>
    <String, dynamic>{
      'lobbyID': instance.lobbyID,
      'leaderID': instance.leaderID,
      'readyIDs': instance.readyIDs,
      'type': instance.$type,
    };

_$PlayingGameState _$$PlayingGameStateFromJson(Map<String, dynamic> json) =>
    _$PlayingGameState(
      lobbyID: LobbyID.fromJson(json['lobbyID'] as Map<String, dynamic>),
      leaderID: UserID.fromJson(json['leaderID'] as Map<String, dynamic>),
      startedAtMSSinceEpoch: json['startedAtMSSinceEpoch'] as int,
      endsAfterSeconds: json['endsAfterSeconds'] as int,
      question: json['question'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$PlayingGameStateToJson(_$PlayingGameState instance) =>
    <String, dynamic>{
      'lobbyID': instance.lobbyID,
      'leaderID': instance.leaderID,
      'startedAtMSSinceEpoch': instance.startedAtMSSinceEpoch,
      'endsAfterSeconds': instance.endsAfterSeconds,
      'question': instance.question,
      'type': instance.$type,
    };

_$WaitingForAnswerGameState _$$WaitingForAnswerGameStateFromJson(
        Map<String, dynamic> json) =>
    _$WaitingForAnswerGameState(
      lobbyID: LobbyID.fromJson(json['lobbyID'] as Map<String, dynamic>),
      leaderID: UserID.fromJson(json['leaderID'] as Map<String, dynamic>),
      hasAnswered: (json['hasAnswered'] as List<dynamic>)
          .map((e) => UserID.fromJson(e as Map<String, dynamic>))
          .toList(),
      question: json['question'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$WaitingForAnswerGameStateToJson(
        _$WaitingForAnswerGameState instance) =>
    <String, dynamic>{
      'lobbyID': instance.lobbyID,
      'leaderID': instance.leaderID,
      'hasAnswered': instance.hasAnswered,
      'question': instance.question,
      'type': instance.$type,
    };

_$CheckingAnswerGameState _$$CheckingAnswerGameStateFromJson(
        Map<String, dynamic> json) =>
    _$CheckingAnswerGameState(
      lobbyID: LobbyID.fromJson(json['lobbyID'] as Map<String, dynamic>),
      leaderID: UserID.fromJson(json['leaderID'] as Map<String, dynamic>),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => UserAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      question: json['question'] as String,
      rightAnswer: json['rightAnswer'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$CheckingAnswerGameStateToJson(
        _$CheckingAnswerGameState instance) =>
    <String, dynamic>{
      'lobbyID': instance.lobbyID,
      'leaderID': instance.leaderID,
      'answers': instance.answers,
      'question': instance.question,
      'rightAnswer': instance.rightAnswer,
      'type': instance.$type,
    };
