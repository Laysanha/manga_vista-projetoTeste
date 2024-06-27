import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _userEmailKey = 'user_email';
  static const String _userPasswordKey = 'user_password';

  Future<void> saveUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userEmailKey, email);
    await prefs.setString(_userPasswordKey, password);
  }

  Future<Map<String, String>?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString(_userEmailKey);
    String? password = prefs.getString(_userPasswordKey);

    if (email != null && password != null){
      return {'email': email, 'password': password};
    }
    return null;
  }

  Future<void> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userEmailKey);
    await prefs.remove(_userPasswordKey);
  }
}