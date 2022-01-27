import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LoginProvider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emialEditingController =
      TextEditingController(text: 'admin@gmail.com');

  final TextEditingController passwordEeditingController =
      TextEditingController(text: "12345678");

  late LginProvider loginProvider;

  @override
  void initState() {
    loginProvider = Provider.of<LginProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("Build Call", name: "BUILD");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: const InputDecoration(
                  helperText: 'admin@gmail.com',
                  helperStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  )),
              controller: emialEditingController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: const InputDecoration(
                  helperText: '12345678',
                  helperStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  )),
              controller: passwordEeditingController,
            ),
          ),
          MaterialButton(
            onPressed: () {
              loginProvider
                  .signIn(
                    context,
                    emialEditingController.text,
                    passwordEeditingController.text,
                  )
                  .then((value) => log(value.toString(), name: "SIGN IN"));
            },
            child: Text(
                !loginProvider.loginStatus ? "Click" : "Login Successfully"),
          ),
        ],
      )),
    );
  }
}
