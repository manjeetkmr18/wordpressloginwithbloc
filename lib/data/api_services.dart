import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wordpress_bloc/data/shred_pref.dart';

final String baseurl = 'https://b70912684e4a.ngrok.io';

class ApiService {
//get Nonce
  Future<String> nonce() async {
    String url = "$baseurl/api/get_nonce/";
    Uri uri = Uri.parse(url);
    final response = await http
        .post(uri, body: {"controller": 'user', "method": 'register'});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var noncee = data['nonce'];
      print("nonce api NONCE :$data");
      return noncee;
    } else {
      throw "Error in NONCE URL";
    }
  }

  //login
  Future authentication(
      {required String username, required String password}) async {
    print('api called');
    String url = "$baseurl/wp-json/jwt-auth/v1/token";
    print(url);
    Uri uri = Uri.parse(url);
    final response = await http.post(uri, body: {
      "username": username,
      "password": password,
    });
    final data = jsonDecode(response.body);
    if (data['statusCode'] == 200) {
      // final data = jsonDecode(response.body);
      print("AUTHENTICATION API RESPONSE:$data");
      Shared shared = Shared();
      shared.save(data['data']['id'], data['data']['token']);
      return data['data'];
    } else {
      print("Error in AUTHENTICATION URL");
    }
  }

//register
  Future registration(
      {
      String? username,
      String? userpass,
      String? displayName,
      String? email,
      String? nonce,
      String? password,
      String? first_name,
      String?last_name
      }) async {
    String url = "$baseurl/api/user/register";
    Uri uri = Uri.parse(url);
    final response = await http.post(uri, body: {
      "username": username,
      "user_pass": password,
      "display_name": displayName,
      "email": email,
      "nonce": nonce,
      "first_name":first_name,
      "last_name":last_name
    });
    final data = jsonDecode(response.body);
    print("registration API RESPONSE:$data");
    print("response statusCode response response:${response.statusCode}");
    if (data['status'] == "ok") {
      return data;
    } else {
      print("Error in registration URL");
      return data['error'];
    }
  }
}
