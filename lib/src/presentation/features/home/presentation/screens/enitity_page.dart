import 'package:asd/src/presentation/features/redeem/screens/redeem.dart';
import 'package:flutter/material.dart';

class EntityPage extends StatefulWidget {
  final String hotelName;
  const EntityPage({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<EntityPage> createState() => _EntityPageState();
}

class _EntityPageState extends State<EntityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotelName),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Redeem"),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RedeemTab(hotelName: widget.hotelName),
          ),
        ),
      ),
    );
  }
}
