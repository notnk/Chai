import 'package:flutter/material.dart';

class testdata extends StatefulWidget {
  final snap;
  const testdata({super.key, required this.snap});

  @override
  State<testdata> createState() => _testdataState();
}

class _testdataState extends State<testdata> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${widget.snap}'),
    );
  }
}
