import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_vm.freezed.dart';

enum UserState {
  notReady,
  ready,
  playing,
  answering,
  answered,
  rightAnswer,
  wrongAnswer,
}

@freezed
class UserVM with _$UserVM {
  const factory UserVM({
    required String id,
    required String name,
    required bool isMe,
    required bool isCreator,
    required bool isLeader,
    required UserState state,
  }) = _UserVM;
}
