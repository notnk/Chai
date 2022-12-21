import 'package:asd/src/misc/colors.dart';
import 'package:asd/src/misc/global_vars.dart';
import 'package:asd/src/presentation/features/redeem/screens/redeem.dart';
import 'package:flutter/material.dart';

class EntityPage extends StatefulWidget {
  final String hotelName;
  final int heroTagIndex;
  const EntityPage(
      {Key? key, required this.hotelName, required this.heroTagIndex})
      : super(key: key);

  @override
  State<EntityPage> createState() => _EntityPageState();
}

class _EntityPageState extends State<EntityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Hero(
              tag: 'test-hero${widget.heroTagIndex}',
              child: Image.network(
                imagesUrl[widget.heroTagIndex],
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ListTile(
            leading: Text("Location"),
            trailing: Icon(Icons.location_on_outlined),
          ),
          const ListTile(
            leading: Text("Menu"),
            trailing: Icon(Icons.menu_book_outlined),
          ),
          const ListTile(
            leading: Text("Contact us"),
            trailing: Icon(Icons.phone_callback_outlined),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text(widget.hotelName),
      ),
      floatingActionButton: FloatingActionButton.extended(
        splashColor: Colors.red,
        tooltip: "Chai lelo :)",
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
