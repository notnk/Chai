import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/presentation/enitty_tab/screens/menu.dart';
import 'package:Chai/src/presentation/redeem/coins/get_coin/get_coin.dart';
import 'package:Chai/src/presentation/redeem/coins/use_coin/select_offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

var uid = FirebaseAuth.instance.currentUser!.uid;
var userData = {};
getData({
  required final String hotelName,
}) async {
  try {
    var snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid + hotelName)
        .get();
    userData = snap.data()!;
  } catch (e) {
    userData['coin'] = 0;
    userData['visit'] = 0;
  }
}

class _NewEntityPageState extends State<NewEntityPage> {
  launchMaps() async {
    final url = Uri.parse(widget.snap['location']);
    if (!await launchUrl(url)) {
      throw 'error';
    }
  }

  @override
  void initState() {
    super.initState();

    // getData(hotelName: widget.snap['name']);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getData(hotelName: widget.snap['name']);
    });
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
        actions: [
          InkWell(
            onTap: () => setState(() {
              getData(
                hotelName: widget.snap['name'],
              );
            }),
            child: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
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
            // onTap: () => setState(() {
            //   getData(hotelName: widget.snap['name']);
            // }),
            child: ListTile(
              leading: const Text("Total Coins"),
              trailing: Text('${userData['coin']}'),
            ),
          ),
          InkWell(
            // onTap: () => setState(() {
            //   getData(hotelName: widget.snap['name']);
            // }),
            child: ListTile(
              leading: const Text("Total visits"),
              trailing: Text('${userData['visit']}'),
            ),
          ),
          // SizedBox(
          //   height: 200,
          //   child: StreamBuilder(
          //     stream:
          //         FirebaseFirestore.instance.collection('users').snapshots(),
          //     builder: (context,
          //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(
          //           child: CircularProgressIndicator(
          //             color: Colors.white,
          //           ),
          //         );
          //       }
          //       return ListView.builder(
          //         itemCount: snapshot.data!.docs.length,
          //         itemBuilder: (context, index) {
          //           if (snapshot.data!.docs[index].id ==
          //               uid + widget.snap['name']) {
          //             return SizedBox(
          //               height: 200,
          //               child: NewHomeItems(
          //                 snap: snapshot.data!.docs[index].data(),
          //                 index: index,
          //               ),
          //             );
          //           } else {
          //             return const CircularProgressIndicator();
          //           }
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
