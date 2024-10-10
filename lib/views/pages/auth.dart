import 'package:bookstore/views/pages/home.dart';
import 'package:bookstore/views/pages/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapShot){
            if(snapShot.hasData){
              return HomePage();
            }else {
              return Welcome();
            }
          }),
    );
  }
}
