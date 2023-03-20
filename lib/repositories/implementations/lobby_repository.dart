import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/common/domain/domain.dart';
import '../interfaces/interfaces.dart';

const _lobbyKeyPrefix = 'lobby ';

@Singleton(as: LobbyRepository)
class ProdLobbyRepository implements LobbyRepository {
  ProdLobbyRepository({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  final SharedPreferences _prefs;
  final _jsonEncoder = const JsonEncoder();
  final _jsonDecoder = const JsonDecoder();

  @override
  Future<Lobby?> get({required LobbyID lobbyID}) async {
    final key = _getKey(lobbyID);

    final string = _prefs.getString(key);

    if (string == null) {
      return null;
    }

    final map = _jsonDecoder.convert(string);
    return Lobby.fromJson(map);
  }

  @override
  Future<void> update({required Lobby lobby}) async {
    final key = _getKey(lobby.id);

    await _prefs.setString(key, _jsonEncoder.convert(lobby));
  }

  String _getKey(LobbyID id) => '$_lobbyKeyPrefix${id.str}';
}
