import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/common/domain/domain.dart';
import '../../features/lobby/domain/domain.dart';
import '../interfaces/game_repository.dart';

const _gameKeyPrefix = 'game ';

@Singleton(as: GameRepository)
class ProdGameRepository implements GameRepository {
  ProdGameRepository({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  final SharedPreferences _prefs;
  final _jsonEncoder = const JsonEncoder();
  final _jsonDecoder = const JsonDecoder();

  @override
  Future<GameState?> get({required LobbyID id}) async {
    final key = _getKey(id);

    final string = _prefs.getString(key);

    if (string == null) {
      return null;
    }

    final map = _jsonDecoder.convert(string);
    return GameState.fromJson(map);
  }

  @override
  Future<void> update({required GameState gameState}) async {
    final key = _getKey(gameState.lobbyID);

    await _prefs.setString(key, _jsonEncoder.convert(gameState));
  }

  String _getKey(LobbyID id) => '$_gameKeyPrefix${id.str}';
}
