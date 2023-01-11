import 'package:Chai/src/data/db_calls/auth_methods.dart';
import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/presentation/home/screens/new_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SuccPage extends StatefulWidget {
  final String hotelName;
  const SuccPage({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<SuccPage> createState() => _SuccPageState();
}

class _SuccPageState extends State<SuccPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Succes"),
        backgroundColor: mobileBackgroundColor,
        centerTitle: true,
      ),
      backgroundColor: mobileBackgroundColor,
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('users').snapshots(),
      //   builder: (context,
      //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(
      //           color: Colors.white,
      //         ),
      //       );
      //     }
      //     return ListTile(
      //       title: ShowCoins(
      //         hotelName: widget.hotelName,
      //         snap: snapshot.data!.docs[0].data(),
      //       ),
      //     );
      //   },
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Rate the food"),
          Center(
            child: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
                AuthMethods()
                    .updateRatings(hotelName: 'Ifthar', userRating: rating);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NewHomePage(),
                  ),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NewHomePage(),
              ),
            ),
            child: const Center(
              child: Text("Home"),
            ),
          ),
        ],
      ),
    );
  }
}
