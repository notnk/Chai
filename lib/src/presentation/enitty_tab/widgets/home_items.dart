import 'package:asd/src/presentation/enitty_tab/screens/new_enitity_page.dart';
import 'package:flutter/material.dart';

class NewHomeItems extends StatefulWidget {
  final snap;
  final int index;
  final String hotelName;
  const NewHomeItems(
      {super.key,
      required this.snap,
      required this.index,
      required this.hotelName});

  @override
  State<NewHomeItems> createState() => _NewHomeItemsState();
}

class _NewHomeItemsState extends State<NewHomeItems> {
  nextPage(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewEntityPage(
          hotelName: widget.hotelName,
          snap: widget.snap,
          index: widget.index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int newIndex = widget.index;
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () => nextPage(widget.index),
          child: ListTile(
            leading: Hero(
              tag: 'hero$newIndex',
              child: Image.network(
                widget.snap['image'],
                fit: BoxFit.cover,
                width: 150,
              ),
            ),
            title: Column(
              children: [
                Text(
                  widget.snap['name'],
                ),
                Text(
                  widget.snap['name'],
                ),
              ],
            ),
            trailing: Text(
              widget.snap['rating'],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
