import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../dto/register_request/register_request.dart';
import '../dto/register_response/register_response.dart';

abstract class AuthProvider {
  Future<JsonEitherWrapper<ProblemDetails, RegisterResponse>> register(
    RegisterRequest request,
  );
}
