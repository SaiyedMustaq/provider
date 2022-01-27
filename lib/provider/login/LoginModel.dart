import 'package:flutter/material.dart';
import 'package:provider_app/network/apiClient.dart';

class LoginModel {
  String emialId;
  String passwoord;
  LoginModel({
    required this.emialId,
    required this.passwoord,
  });
}
