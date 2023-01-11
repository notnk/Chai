import 'package:Chai/src/presentation/enitty_tab/screens/new_enitity_page.dart';
import 'package:flutter/material.dart';

class NewHomeItems extends StatefulWidget {
  final snap;
  final int index;

  const NewHomeItems(
      {super.key,
      required this.snap,
      required this.index,
    });

  @override
  State<NewHomeItems> createState() => _NewHomeItemsState();
}

class _NewHomeItemsState extends State<NewHomeItems> {
  nextPage(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewEntityPage(
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
                width: 110,
              ),
            ),
            title: Text(
              widget.snap['name'],
            ),
            hoverColor: Colors.red,
            subtitle: const Text(
              "More details will be added soon",
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
