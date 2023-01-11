import 'package:Chai/src/data/db_calls/auth_methods.dart';
import 'package:Chai/src/misc/colors.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  onTapLogin() async {
    String res = await AuthMethods().signInWithGoogle();
    if (res != 'succ') {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(3),
        child: IntroductionScreen(
          globalBackgroundColor: mobileBackgroundColor,
          next: const Icon(Icons.navigate_next_outlined),
          showSkipButton: true,
          baseBtnStyle: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.white10,
            ),
          ),
          backSemantic: 'Back',
          dotsDecorator: const DotsDecorator(
            color: Colors.red,
            activeColor: Colors.amberAccent,
          ),
          back: const Text(
            'Back',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          skip: const Text(
            "Skip",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          done: const Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          dotsFlex: 3,
          onDone: () => onTapLogin(),
          pages: [
            PageViewModel(
              title: '1',
              body: 'USP',
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
            ),
            PageViewModel(
              title: 'Passwords',
              // body: 'Passwords',
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("Ifthar:2000"),
                  Text("Arafa:2002"),
                  Text("Salt:2001"),
                  Text("TopForm:2003"),
                ],
              ),
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
            ),
            PageViewModel(
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
              title: 'Login',
              // bodyWidget: Center(
              //   child: TextButton(
              //     onPressed: () => onTapLogin(),
              //     child: const Text("Login"),
              //   ),
              // ),
              body: 'Hit Login button to Login using Google',
            ),
          ],
        ),
      ),
    );
  }
}
