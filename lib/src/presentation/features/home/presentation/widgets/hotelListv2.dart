import 'package:flutter/material.dart';

import '../../../../../data/global_vars.dart';

Column listHotels(int index) {
  return Column(
    children: [
      Row(
        children: [
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            height: 100,
            child: Image.network(
              imagesUrl[index],
            ),
          ),
          const SizedBox(
            width: 100,
          ),
          Column(
            children: [
              Text(hotelsName[index]),
              const Text("data"),
              const Text("data"),
            ],
          ),
          const SizedBox(
            width: 90,
          ),
          const Icon(Icons.favorite_border_outlined)
        ],
      ),
    ],
  );
}
