import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../dto/get_user_response/get_user_response.dart';

abstract class UserProvider {
  Future<JsonEitherWrapper<ProblemDetails, GetUserResponse>> getUser(
    String id,
  );
}
