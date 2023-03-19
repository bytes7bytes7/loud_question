import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../dto/get_lobbies_response/get_lobbies_response.dart';

abstract class HomeProvider {
  Future<JsonEitherWrapper<ProblemDetails, GetLobbiesResponse>> getLobbies();
}
