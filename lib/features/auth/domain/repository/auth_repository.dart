abstract class LoginRepository {
  Future<bool> login(String username, String password);
  Future<bool> logOut();
}

class FakeLoginRepository implements LoginRepository {
  @override
  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<bool> logOut() async {
    await Future.delayed(const Duration(seconds: 1));
    return false;
  }
}
