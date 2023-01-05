import 'package:Chai/src/data/services/auth_methods.dart';
import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/presentation/enitty_tab/screens/menu.dart';
import 'package:Chai/src/presentation/redeem/coins/get_coin/get_coin.dart';
import 'package:Chai/src/presentation/redeem/coins/use_coin/select_offer.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:url_launcher/url_launcher.dart';

class NewEntityPage extends StatefulWidget {
  final snap;
  final int index;
  const NewEntityPage({
    super.key,
    required this.snap,
    required this.index,
  });

  @override
  State<NewEntityPage> createState() => _NewEntityPageState();
}

final data = AuthMethods().getUserDetails(hotelName: 'Ifthar');

class _NewEntityPageState extends State<NewEntityPage> {
  launchMaps() async {
    final url = Uri.parse(widget.snap['location']);
    if (!await launchUrl(url)) {
      throw 'error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
          SwipeablePageRoute(
            builder: (context) => GetCoin(
              hotelName: widget.snap['name'],
            ),
          ),
        ),
        label: const Icon(Icons.add),
      ),
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text(
          widget.snap['name'],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Hero(
              tag: 'hero${widget.index}',
              child: Image.network(
                widget.snap['image'],
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () => canLaunchUrl(Uri.parse(widget.snap['location'])),
                child: const Icon(
                  Icons.location_on_outlined,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  SwipeablePageRoute(
                    builder: (context) => Menu(
                      hotelName: widget.snap['name'],
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.menu_book_outlined,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.contact_phone_outlined,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
              SwipeablePageRoute(
                builder: (context) => SelectOffer(
                  hotelName: widget.snap['name'],
                ),
              ),
            ),
            child: const ListTile(
              leading: Text("Avail Offers"),
              trailing: Icon(Icons.currency_exchange_outlined),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: const ListTile(
              leading: Text("Total vists"),
              trailing: Text("9"),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: const ListTile(
              leading: Text("Balance coins"),
              trailing: Text("140"),
            ),
          ),
          // StreamBuilder(
          //   stream: FirebaseFirestore.instance.collection('users').snapshots(),
          //   builder: (context,
          //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          //     if (!snapshot.hasData) {
          //       return const CircularProgressIndicator();
          //     } else {
          //       print(snapshot.data!);
          //       return testdata(
          //         snap: snapshot.data!.docs,
          //       );
          //     }
          //   },
          // ),
          // FutureBuilder(
          //   future: data,
          //   builder: (context, snapshot) {
          //     return Text('$data');
          //   },
          // ),
        ],
      ),
    );
  }
}
