import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mm_ajanda/Utility/reset_password.dart';
import 'package:mm_ajanda/Utility/auth_utility.dart';
import 'package:mm_ajanda/main.dart';
import 'package:email_validator/email_validator.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const SignInScreen({Key? key, required this.onClickedSignUp}) : super(key: key);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top:100, right: 15.0, bottom:50),
              child: Container(
                color: Colors.transparent,
                child: const Center(
                  child: Image(
                    image: NetworkImage('https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png'),
                    width: 75,
                    height: 75,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:50, top:15, right:50, bottom:15),
              child: SizedBox(
                child: TextFormField(
                  controller: emailEditingController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email address!'
                      : null,
                  style: const TextStyle(
                    color: Color.fromRGBO(121, 135, 119, 1),
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(121, 135, 119, 1)),

                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(121, 135, 119, 1))
                    ),
                    // errorBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(35.0),
                    // ),
                    fillColor: Colors.black,
                    focusColor: Colors.black,
                    hoverColor: Colors.black,
                    labelText: 'E-Mail',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(121, 135, 119, 1)
                    ),
                    hintText: 'Type your e-mail address...',
                    hintStyle: TextStyle(
                        color: Color.fromRGBO(121, 135, 119, 1)
                    )
                  ),
                  autofocus: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:50, top:15, right:50, bottom:15),
              child: SizedBox(
                child: TextFormField(
                  controller: passwordEditingController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  style: const TextStyle(
                    color: Color.fromRGBO(121, 135, 119, 1),
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(121, 135, 119, 1)),

                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(121, 135, 119, 1))
                    ),
                    fillColor: Colors.black,
                    focusColor: Colors.black,
                    hoverColor: Colors.black,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(121, 135, 119, 1)
                    ),
                    hintText: 'Type your password...',
                    hintStyle: TextStyle(
                        color: Color.fromRGBO(121, 135, 119, 1)
                    )
                  ),
                  autofocus: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:50, top:15, right:50, bottom:50),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(121, 135, 119, 1))
                ),
                onPressed: signIn,
                child: const Text('Sign In'),
              ),
            ),
            const SizedBox(height: 24,),
            GestureDetector(
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color.fromRGBO(121, 135, 119, 1)
                ),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ForgotPasswordScreen()
              )),
            ),
            const SizedBox(height: 24,),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Color.fromRGBO(121, 135, 119, 1),
                ),
                text: 'Don\'t you have an account yet? ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Sign Up',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(121, 135, 119, 1)
                    )
                  )
                ]
              )
            ),
          ],
        ),
      ),
    );
  }
  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator())
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailEditingController.text.trim(),
          password: passwordEditingController.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    // Navigator.of(context) not works!
    navigatorKey.currentState!.popUntil((route)=> route.isFirst);
  }
}



