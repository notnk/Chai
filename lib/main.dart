import 'package:Chai/src/presentation/home/screens/new_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'src/presentation/login/intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const NewHomePage();
          } else {
            return const IntroPage();
          }
        },
      ),
    ),
  );
}
