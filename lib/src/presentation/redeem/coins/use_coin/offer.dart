import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'submit_use_coin.dart';

class Offers extends StatefulWidget {
  final snap;
  final int index;
  final String hotelName;
  const Offers({
    super.key,
    required this.snap,
    required this.index,
    required this.hotelName,
  });

  @override
  State<Offers> createState() => OffersState();
}

class OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    final coin = int.parse(widget.snap['coin']);

    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(
            SwipeablePageRoute(
              builder: (context) => SubmitUseCoin(
                hotelName: widget.hotelName,
                offerCoin: coin,
              ),
            ),
          ),
          child: ListTile(
            title: Text(
              widget.snap['name'],
            ),
            trailing: Text(
              widget.snap['coin'],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
