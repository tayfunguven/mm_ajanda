import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mm_ajanda/Utility/authentication.dart';
import 'package:mm_ajanda/Utility/email_verification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Utility/auth_utility.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Base());
}

final navigatorKey = GlobalKey<NavigatorState>();

class Base extends StatelessWidget {
  const Base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth',
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans(
          fontWeight: FontWeight.w500
        ).fontFamily,
        primaryColor: const Color.fromRGBO(121, 135, 119, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(121, 135, 119, 1)
        )
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError){
            return const Center(child: Text('Something went wrong!'),);
          } else if (snapshot.hasData) {
            return const EmailVerification();
          } else {
            return const Authentication();
          }
        }
      ),
    );
  }
}


// class AuthTypeSelector extends StatelessWidget {
//   const AuthTypeSelector({Key? key}) : super(key: key);
//
//   void _pushPage(BuildContext context, Widget page){
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (_) => page),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 alignment: Alignment.center,
//                 child: SignInButtonBuilder(
//                   icon: Icons.person_add,
//                   backgroundColor: Colors.indigo,
//                   text: 'Registration',
//                   onPressed: () => _pushPage(context, const RegisterPage()),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 alignment: Alignment.center,
//                 child: SignInButtonBuilder(
//                   icon: Icons.verified_user,
//                   backgroundColor: Colors.orange,
//                   text: 'Sign In',
//                   onPressed: () => _pushPage(context, const SignInPage()),
//                 ),
//               ),
//             ],
//           ),
//     );
//   }
// }
//
