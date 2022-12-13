import 'package:flutter/material.dart';

class topListView extends StatelessWidget {
  const topListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: 160.0,
            child: Image.network(
                "https://media.istockphoto.com/id/1328325937/photo/roasted-tomatoes-cut-varied-in-baking-tray-and-ladle-with-basil-and-rosemary-on-wood.jpg?b=1&s=170667a&w=0&k=20&c=bJuysTK8boQWGY7mQzgdl2-58Nw0LS-iLK4YU6QYb0Y="),
            // color: Colors.red,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: 10.0,
            // color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 160.0,
            // color: Colors.blue,
          ),
          Container(
            width: 10.0,
            // color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 160.0,
            // color: Colors.green,
          ),
          Container(
            width: 10.0,
            // color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 160.0,
            // color: Colors.yellow,
          ),
          Container(
            width: 10.0,
            // color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 160.0,
            // color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
