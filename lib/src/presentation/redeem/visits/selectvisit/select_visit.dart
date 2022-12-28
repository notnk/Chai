import 'package:asd/src/misc/colors.dart';
import 'package:asd/src/misc/global_vars.dart';
import 'package:asd/src/presentation/redeem/coins/use_coin/submit_use_coin.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class SelectVisit extends StatefulWidget {
  final String hotelName;
  const SelectVisit({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<SelectVisit> createState() => _SelectVisitState();
}

class _SelectVisitState extends State<SelectVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Column(
        children: [
          ListTile(
            leading: Text(
              "Visits for ${widget.hotelName}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.currency_exchange_outlined),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  // height: MediaQuery.of(context).size.height / 2,
                  height: 400,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                        child: ListTile(
                          leading: Image.network(
                            imagesUrl[index],
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                          title: Text('Visit Name $index'),
                          trailing: IconButton(
                            onPressed: () => Navigator.of(context).push(
                              SwipeablePageRoute(
                                builder: (context) => SubmitUseCoin(
                                  hotelName: hotelsName[index],
                                  offerCoin: index + 1,
                                ),
                              ),
                            ),
                            icon: const Icon(Icons.next_plan_outlined),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
