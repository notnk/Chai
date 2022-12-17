import 'package:asd/src/presentation/features/redeem/screens/use_coin.dart';
import 'package:flutter/material.dart';

import 'get_coin.dart';

class RedeemTab extends StatefulWidget {
  final String hotelName;
  const RedeemTab({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<RedeemTab> createState() => _RedeemTabState();
}

class _RedeemTabState extends State<RedeemTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            GetCoin(hotelName: widget.hotelName),
            UseCoin(hotelName: widget.hotelName),
          ],
        ),
        appBar: AppBar(
          title: const Text("Redeem"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.generating_tokens_outlined),
                text: 'Get Coins',
              ),
              Tab(
                icon: Icon(Icons.token_sharp),
                text: 'Use Coins',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
