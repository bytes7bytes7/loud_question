import 'package:injectable/injectable.dart';
import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../../../common/domain/entities/lobby/lobby.dart';
import '../dto/dto.dart';
import '../providers/home_provider.dart';

@singleton
class HomeService {
  const HomeService({
    required HomeProvider homeProvider,
  }) : _homeProvider = homeProvider;

  final HomeProvider _homeProvider;

  Future<List<Lobby>> load() async {
    late JsonEitherWrapper<ProblemDetails, GetLobbiesResponse> response;

    try {
      response = await _homeProvider.getLobbies();
    } catch (e) {
      throw Exception();
    }

    return response.value.fold(
      (l) {
        throw Exception();
      },
      (r) {
        return r.lobbies;
      },
    );
  }
}
