import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/config.dart';
import 'package:flutter_scaffold/models/user.dart';
import 'package:flutter_scaffold/services/logged_in_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final storage = FlutterSecureStorage();
  // Create storage
  Future<Map> login(UserCredential userCredential,
      {BuildContext context}) async {
    final response = await http.post('$BASE_URL/api/customer/login', body: {
      'email': userCredential.usernameOrEmail,
      'password': userCredential.password
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      // return User.fromJson(json.decode(response.body));
      LoggedInUser loggedInUser = loggedInUserFromJson(response.body);
      setUser(response.body);

      var checkoutAddress =
          await http.post('https://shop.yegobox.com/api/checkout/save-address',
              body: json.encode({
                "token": loggedInUser.token,
                "billing": {
                  "address1": {"0": loggedInUser.data.phone},
                  "use_for_shipping": "true",
                  "first_name": loggedInUser.data.firstName,
                  "last_name": loggedInUser.data.lastName,
                  "email": loggedInUser.data.email,
                  "city": "none",
                  "state": "none",
                  "postcode": "none",
                  "country": "none",
                  "phone": loggedInUser.data.phone
                },
                "shipping": {
                  "address1": {"0": loggedInUser.data.phone}
                }
              }),
              headers: {
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.contentTypeHeader: 'application/json'
          });
      if (checkoutAddress.statusCode == 200) {
      } else {}
      toast("Logged in");
      Navigator.pop(context);
      Navigator.pushNamed(context, '/');
      return jsonDecode(response.body);
    } else {
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
      'username': user.firstName,
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
    await storage.write(key: 'user', value: value);
  }

  getUser() async {
    String user = await storage.read(key: 'user');
    if (user != null) {
      return jsonDecode(user);
    }
  }

  logout() async {
    await storage.delete(key: 'user');
  }

  void toast(String message) {
    Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
