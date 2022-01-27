import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_app/network/apiClient.dart';
import 'package:provider_app/provider/homePage/HomePage.dart';

class LginProvider extends ChangeNotifier {
  bool _loginStatus = false;

  bool get loginStatus => _loginStatus;

  Future<bool> signIn(
      BuildContext context, String emial, String password) async {
    log('$emial $password', name: "LOG");

    if (emial == "admin@gmail.com" && password == "12345678") {
      _loginStatus = true;
    } else {
      _loginStatus = false;
    }

    notifyListeners();
    if (_loginStatus == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    return _loginStatus;
  }
}
