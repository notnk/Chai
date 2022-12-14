import 'package:flutter/material.dart';

import 'get_coin.dart';

class RedeemTab extends StatefulWidget {
  const RedeemTab({Key? key}) : super(key: key);

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
            getCoin(),
            const Text("data"),
          ],
        ),
        appBar: AppBar(
          title: const Text("Redeem"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.generating_tokens_outlined),
                text: 'Use Coins',
              ),
              Tab(
                icon: Icon(Icons.token_sharp),
                text: 'Get Coins',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetCoin {}
