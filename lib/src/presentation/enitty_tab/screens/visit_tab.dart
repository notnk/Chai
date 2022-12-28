import 'package:asd/src/misc/colors.dart';
import 'package:asd/src/presentation/redeem/visits/selectvisit/select_visit.dart';
import 'package:flutter/material.dart';

import '../../redeem/visits/getvisit/get_visit.dart';

class VisitTab extends StatefulWidget {
  final String hotelName;
  const VisitTab({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<VisitTab> createState() => _VisitTabState();
}

class _VisitTabState extends State<VisitTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            GetVisit(hotelName: widget.hotelName),
            SelectVisit(hotelName: widget.hotelName),
          ],
        ),
        backgroundColor: mobileBackgroundColor,
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: const Text("Visit"),
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
