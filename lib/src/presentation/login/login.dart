import 'package:asd/src/misc/colors.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Welcome to Chai"),
        centerTitle: true,
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
      ),
      backgroundColor: mobileBackgroundColor,
      // body: Center(
      //   child: Container(
      //     height: 100,
      //     padding: const EdgeInsets.symmetric(horizontal: 32),
      //     child: GestureDetector(
      //       onTap: () => AuthMethods().signInWithGoogle(context),
      //       child: Container(
      //         alignment: Alignment.center,
      //         padding: const EdgeInsets.symmetric(vertical: 12),
      //         decoration: const ShapeDecoration(
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.all(
      //               Radius.circular(40),
      //             ),
      //           ),
      //           color: blueColor,
      //         ),
      //         child: const Text("Google Login"),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
