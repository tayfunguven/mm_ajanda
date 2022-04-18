import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mm_ajanda/Utility/auth_utility.dart';
import 'package:mm_ajanda/Views/home_screen.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // user needs to be created before!
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    // we need to reload each time before
    // checking the email verification since its status could be changed!
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);

    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
      ? const HomeScreen(currentIndex: 0)
      : Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(121, 135, 119, 1),
        title: const Text('Email Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'An email has been sent to verify your email.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(left:50, top:15, right:50, bottom:50),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(121, 135, 119, 1))
                ),
                onPressed: canResendEmail ? sendVerificationEmail : null,
                child: const Text('Resend Email'),
              ),
            ),
            const SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(left:50, top:15, right:50, bottom:50),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                ),
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: const Text('Cancel', style: TextStyle(color: Color.fromRGBO(121, 135, 119, 1)),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
