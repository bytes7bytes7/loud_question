abstract class TokenRepository {
  Future<String?> getToken();

  Future<void> saveToken({required String token});

  Future<void> removeToken();
}
