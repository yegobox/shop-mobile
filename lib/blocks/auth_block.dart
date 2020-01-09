import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:flutter_scaffold/models/user.dart';
import 'package:flutter_scaffold/services/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

class AuthBlock extends ChangeNotifier {
  AuthBlock() {
    setUser();
  }
  AuthService _authService = AuthService();
  // Index
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Loading
  bool _loading = false;
  String _token;
  String get token => _token;
  String _loadingType;
  bool _registered = false;
  bool get registered => _registered;
  bool get loading => _loading;
  String get loadingType => _loadingType;

  set registered(bool reg) {
    _registered = reg;
    notifyListeners();
  }

  set loading(bool loadingState) {
    _loading = loadingState;
    notifyListeners();
  }

  set token(String token) {
    _token = token;
    notifyListeners();
  }

  set loadingType(String loadingType) {
    _loadingType = loadingType;
    notifyListeners();
  }

  // Loading
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool isUserExist) {
    _isLoggedIn = isUserExist;
    notifyListeners();
  }

  // user
  Map _user = {};
  Map get user => _user;
  setUser() async {
    _user = await _authService.getUser();

    isLoggedIn = _user == null ? false : true;
    if (isLoggedIn) {
      token = _user['token'];
    }
    notifyListeners();
  }

  login(UserCredential userCredential, {BuildContext context}) async {
    loading = true;
    loadingType = 'login';
    await _authService.login(userCredential, context: context);
    setUser();
    if (token != null) {
      loading = false;
      toast("Logged in");
      Navigator.pop(context);
      Navigator.pushNamed(context, '/');
      notifyListeners();
    }
    loading = false;
  }

  register(User user, {BuildContext context}) async {
    loading = true;
    loadingType = 'register';

    final response = await http.post('$BASE_URL/api/customer/register', body: {
      'email': user.email,
      'password': user.password,
      'first_name': user.firstName,
      'last_name': user.firstName,
      'password_confirmation': user.passwordConfirmation,
      'phone': user.phone,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json'
    });
    final int statusCode = response.statusCode;
    print(statusCode);
    print(response.body);
    if (statusCode < 200 || statusCode > 400 || json == null) {
      loading = false;
      loadingType = 'none';
      return;
    } else {
      registered = true;
      loading = false;
      loadingType = 'none';

      toast(AppLocalizations.of(context).translate('ACCOUNTCREATED'));
      Navigator.pop(context);
      Navigator.pushNamed(context, '/');
      notifyListeners();
    }
  }

  logout() async {
    await _authService.logout();
    isLoggedIn = false;
    notifyListeners();
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
