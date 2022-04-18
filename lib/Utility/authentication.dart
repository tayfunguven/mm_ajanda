import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mm_ajanda/Views/signin_screen.dart';
import 'package:mm_ajanda/Views/signup_screen.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? SignInScreen(onClickedSignUp: toggle)
      : SignUpScreen(onClickedSignIn: toggle);
  void toggle() => setState(() => isLogin = !isLogin);
}
