import 'dart:convert';
import 'dart:io';

import 'package:flutter_scaffold/config.dart';
import 'package:flutter_scaffold/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'data.dart';

class AuthService {
  final storage = FlutterSecureStorage();
  // Create storage
  Future<Map> login(UserCredential userCredential) async {
    final response = await http.post('$BASE_URL/api/customer/login', body: {
      'email': userCredential.usernameOrEmail,
      'password': userCredential.password
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json'
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      // return User.fromJson(json.decode(response.body));

      setUser(response.body);
      return jsonDecode(response.body);
    } else {
      print(response.body);
      if (response.statusCode == 403) {
        Fluttertoast.showToast(
            msg: "Invalid Credentials",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            fontSize: 16.0);
      }
      return jsonDecode(response.body);
    }
  }

  Future<Map> register(User user) async {
    final response = await http.post('$BASE_URL/api/customer/register', body: {
      'username': user.username,
      'password': user.password,
      'email': user.email
    });
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      // return User.fromJson(json.decode(response.body));
      return jsonDecode(response.body);
    } else {
      if (response.statusCode == 400) {
        Fluttertoast.showToast(
            msg: 'Email already exist',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            fontSize: 16.0);
      }
      return jsonDecode(response.body);
    }
  }

  setUser(String value) async {
    final response = convertFromJson(value);
    await storage.write(key: 'user', value: value);
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.setInt('status', response.data.status);
//    prefs.setString('name', response.data.name);
//    prefs.setString('token', response.token);
//    prefs.setString('first_name', response.data.firstName);
//    prefs.setString('last_name', response.data.lastName);
//    prefs.setString('gender', response.data.gender);
//    prefs.setString('date_of_birth', response.data.dateOfBirth);
  }

  getUser() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    return jsonDecode(prefs.getString('token'));
    String user = await storage.read(key: 'user');
    if (user != null) {
      return jsonDecode(user);
    }
  }

  logout() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.setString('token', null);
    await storage.delete(key: 'user');
  }
}
