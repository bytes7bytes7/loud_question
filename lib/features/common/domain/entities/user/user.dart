import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../../value_objects/user_id/user_id.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required UserID id,
    required String name,
  }) = _User;

  factory User.fromJson(JsonMap json) => _$UserFromJson(json);
}
