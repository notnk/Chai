import 'package:flutter/material.dart';

class ShowCoins extends StatefulWidget {
  final snap;
  final String hotelName;
  const ShowCoins({
    super.key,
    required this.hotelName,
    this.snap,
  });

  @override
  State<ShowCoins> createState() => _ShowCoinsState();
}

class _ShowCoinsState extends State<ShowCoins> {
  @override
  Widget build(BuildContext context) {
    print(widget.snap);
    var coin = widget.snap["coin"];
    return Center(
      child: Text("$coin"),
    );
  }
}
