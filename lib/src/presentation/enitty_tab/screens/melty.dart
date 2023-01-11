import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/presentation/enitty_tab/screens/menu.dart';
import 'package:Chai/src/presentation/redeem/coins/get_coin/get_coin.dart';
import 'package:Chai/src/presentation/redeem/coins/use_coin/select_offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MeltyPage extends StatefulWidget {
  const MeltyPage({
    super.key,
  });

  @override
  State<MeltyPage> createState() => _MeltyPageState();
}

class _MeltyPageState extends State<MeltyPage> {
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

  @override
  void initState() {
    super.initState();
    // getData(hotelName: widget.snap['name']);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getData(hotelName: 'Meltyway');
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const GetCoin(
              hotelName: 'Meltyway',
            ),
          ),
        ),
        label: const Icon(Icons.add),
      ),
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text(
          'Meltyway',
        ),
        actions: [
          InkWell(
            onTap: () => setState(() {
              getData(
                hotelName: 'Meltyway',
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
            child: Image.network(
              'https://images.pexels.com/photos/239975/pexels-photo-239975.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
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
              const InkWell(
                child: Icon(
                  Icons.location_on_outlined,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Menu(
                      hotelName: 'Meltyway',
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
              MaterialPageRoute(
                builder: (context) => const SelectOffer(
                  hotelName: 'Meltyway',
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
        ],
      ),
    );
  }
}
