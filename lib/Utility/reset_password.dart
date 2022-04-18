import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mm_ajanda/Utility/auth_utility.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Receive an email to\nreset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 24,),
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Email'
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null,
              ),
              const SizedBox(height: 24,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: resetPassword,
                child: const Text('Reset Password')
              )
            ],
          ),
        ),
      ),
    );
  }
  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator())
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      Utils.showSnackBar('An Email has been sent to reset your password.');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
