import 'package:Chai/src/data/services/auth_methods.dart';
import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/presentation/home/screens/home_tab.dart';
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
    if (res == 'succ') {
      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeTab(),
          ),
        );
      }
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
          backSemantic: 'Back',
          back: const Text('Back'),
          skip: const Text("Skip"),
          done: const Text("Login"),
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
              title: 'Offers',
              body: 'Offers',
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
            ),
            PageViewModel(
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
              title: 'Login',
              bodyWidget: Center(
                child: TextButton(
                  onPressed: () => onTapLogin(),
                  child: const Text("Login"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
