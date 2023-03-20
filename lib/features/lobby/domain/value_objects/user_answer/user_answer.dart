import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../../../../common/domain/domain.dart';

part 'user_answer.freezed.dart';

part 'user_answer.g.dart';

@freezed
class UserAnswer with _$UserAnswer {
  const factory UserAnswer({
    required UserID userID,
    required String answer,
  }) = _UserAnswer;

  factory UserAnswer.fromJson(JsonMap json) => _$UserAnswerFromJson(json);
}
