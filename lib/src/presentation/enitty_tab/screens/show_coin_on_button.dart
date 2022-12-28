import 'package:flutter/material.dart';

class ShowCoinsOnButton extends StatefulWidget {
  final snap;
  final String hotelName;
  // final int index;
  const ShowCoinsOnButton({
    Key? key,
    required this.hotelName,
    this.snap,
  }) : super(key: key);

  @override
  State<ShowCoinsOnButton> createState() => _ShowCoinsOnButtonState();
}

class _ShowCoinsOnButtonState extends State<ShowCoinsOnButton> {
  @override
  Widget build(BuildContext context) {
    print(widget.snap['coin']);
    return Container(
      child: Center(
        child: Text('${widget.snap['coin']}'),
      ),
    );
  }
}
