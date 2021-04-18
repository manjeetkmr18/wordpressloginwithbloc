import 'package:shared_preferences/shared_preferences.dart';

class User {
  int uid;
  User({required this.uid});
}

class Shared {
  save(int uid, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('uid', uid);
    await prefs.setString('token', token);
  }

  Future getSaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Object? uid = prefs.get('uid');
    return uid;
  }

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Object? token = prefs.get('token');
    return token;
  }

  Future clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
