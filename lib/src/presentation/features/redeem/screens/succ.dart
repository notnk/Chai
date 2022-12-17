import 'package:flutter/material.dart';

class SuccPage extends StatefulWidget {
  const SuccPage({Key? key}) : super(key: key);

  @override
  State<SuccPage> createState() => _SuccPageState();
}

class _SuccPageState extends State<SuccPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Points altered"),
      ),
    );
  }
}
