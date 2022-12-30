import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/misc/global_vars.dart';
import 'package:Chai/src/presentation/redeem/coins/use_coin/submit_use_coin.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class SelectOffer extends StatefulWidget {
  final String hotelName;
  const SelectOffer({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<SelectOffer> createState() => _SelectOfferState();
}

class _SelectOfferState extends State<SelectOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Column(
        children: [
          ListTile(
            leading: Text(
              "Offers for ${widget.hotelName}",
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
                          title: Text('offer Name $index'),
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
