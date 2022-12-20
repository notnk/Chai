import 'package:asd/src/presentation/features/login/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(3),
        child: IntroductionScreen(
          next: const Icon(Icons.navigate_next_outlined),
          showSkipButton: true,
          skip: const Text("skip"),
          done: const Text("done"),
          dotsFlex: 3,
          onDone: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginWidget(),
            ),
            
          ),
          pages: [
            PageViewModel(
              title: '1',
              body: 'USP',
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
            ),
            PageViewModel(
              title: '2',
              body: 'offers',
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
            ),
            PageViewModel(
              title: '3',
              body: 'login',
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
