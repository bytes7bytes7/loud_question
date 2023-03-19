import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../repositories/interfaces/interfaces.dart';

const _authTokenHeaderKey = 'Authorization';

@singleton
class TokenService {
  const TokenService({
    required Dio dio,
    required TokenRepository tokenRepository,
  })  : _dio = dio,
        _tokenRepository = tokenRepository;

  final Dio _dio;
  final TokenRepository _tokenRepository;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    final token = await _tokenRepository.getToken();

    if (token != null) {
      _setTokenToHeaders(token);
    }
  }

  Future<String?> getToken() async {
    return _tokenRepository.getToken();
  }

  Future<void> saveToken({required String token}) async {
    _setTokenToHeaders(token);

    await _tokenRepository.saveToken(token: token);
  }

  Future<void> removeToken() async {
    final newHeaders = Map<String, Object?>.from(_dio.options.headers)
      ..remove(_authTokenHeaderKey);

    _dio.options.headers = newHeaders;

    await _tokenRepository.removeToken();
  }

  void _setTokenToHeaders(String token) {
    final newHeaders = Map<String, Object?>.from(_dio.options.headers)
      ..[_authTokenHeaderKey] = _formatToken(token);

    _dio.options.headers = newHeaders;
  }

  String _formatToken(String token) {
    return 'Bearer $token';
  }
}
