import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_vm.freezed.dart';

enum UserRole {
  admin,
  leader,
  me,
  other,
}

enum UserState {
  notReady,
  ready,
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
    required UserRole role,
    required UserState state,
  }) = _UserVM;
}
