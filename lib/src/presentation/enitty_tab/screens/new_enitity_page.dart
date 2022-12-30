import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/presentation/enitty_tab/screens/menu.dart';
import 'package:Chai/src/presentation/enitty_tab/screens/visit_tab.dart';
import 'package:Chai/src/presentation/redeem/redeem.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class NewEntityPage extends StatefulWidget {
  final String hotelName;
  final snap;
  final int index;
  const NewEntityPage(
      {super.key,
      required this.snap,
      required this.index,
      required this.hotelName});

  @override
  State<NewEntityPage> createState() => _NewEntityPageState();
}

class _NewEntityPageState extends State<NewEntityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.orange,
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: const Icon(Icons.location_on_outlined),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.orange,
                //   borderRadius: BorderRadius.circular(13),
                // ),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(
                    SwipeablePageRoute(
                      builder: (context) => Menu(
                        hotelName: widget.hotelName,
                      ),
                    ),
                  ),
                  child: const Icon(Icons.menu_book_outlined),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.orange,
                //   borderRadius: BorderRadius.circular(13),
                // ),
                child: const Icon(Icons.contact_phone_outlined),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
              SwipeablePageRoute(
                builder: (context) => RedeemTab(
                  hotelName: widget.hotelName,
                ),
              ),
            ),
            child: const ListTile(
              leading: Text("Coins"),
              trailing: Icon(Icons.currency_exchange_outlined),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(
              SwipeablePageRoute(
                builder: (context) => VisitTab(
                  hotelName: widget.hotelName,
                ),
              ),
            ),
            child: const ListTile(
              leading: Text("Vists"),
              trailing: Icon(Icons.vaping_rooms_outlined),
            ),
          ),
          // ListTile(
          //   leading: Text(
          //     widget.snap['location'],
          //   ),
          //   trailing: const Icon(Icons.location_on_outlined),
          // ),
          // InkWell(
          //   onTap: () => Navigator.of(context).push(
          //     SwipeablePageRoute(
          //       builder: (context) => Menu(
          //         hotelName: widget.hotelName,
          //       ),
          //     ),
          //   ),
          //   child: const ListTile(
          //     leading: Text("Menu"),
          //     trailing: Icon(Icons.menu_book_outlined),
          //   ),
          // ),
          // const ListTile(
          //   leading: Text("Contact us"),
          //   trailing: Icon(Icons.phone_callback_outlined),
          // ),
        ],
      ),
    );
  }
}
