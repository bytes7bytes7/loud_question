import 'package:injectable/injectable.dart';

import '../../../features/home/application/application.dart';
import '../router/router.dart';
import 'coordinator.dart';

@Singleton(as: HomeCoordinator)
class ProdHomeCoordinator extends Coordinator implements HomeCoordinator {
  ProdHomeCoordinator({required super.goRouter});

  @override
  void openLobby({required String lobbyID}) {
    LobbyRoute(lobbyID: lobbyID).push(goRouter);
  }
}
