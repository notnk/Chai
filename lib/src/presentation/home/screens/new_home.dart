import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/presentation/enitty_tab/screens/resturant.dart';
import 'package:Chai/src/presentation/home/screens/no_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class NewHomePage extends StatelessWidget {
  const NewHomePage({super.key});
  LinearGradient _colorGradient() {
    return const LinearGradient(
      colors: [
        Colors.deepPurple,
        Colors.purple,
        Colors.pink,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
              ),
            ],
            // gradient: LinearGradient(
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            //   colors: [
            //     Colors.purple,
            //     Colors.blue,
            //   ],
            // ),
            // color: Colors.black,
          ),
        ),
        // actions: [
        //   InkWell(
        //     onTap: () => FirebaseAuth.instance.signOut(),
        //     child: CircleAvatar(
        //       radius: 20,
        //       backgroundImage: NetworkImage(
        //         auth.currentUser!.photoURL ??
        //             "https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_960_720.png",
        //       ),
        //     ),
        //   ),
        //   const SizedBox(
        //     width: 15,
        //   ),
        // ],
        title: Text(
          "Chai",
          style: GoogleFonts.caramel(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            // color: Colors.black,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: mobileBackgroundColor,
        child: ListView(
          children: [
            const DrawerHeader(
              margin: EdgeInsets.all(4),
              child: Center(
                child: Text(
                  "Welcome to Chai",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  auth.currentUser!.photoURL ??
                      "https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_960_720.png",
                ),
              ),
              title: Text(
                '${auth.currentUser!.displayName}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.email_outlined),
              title: Text(
                '${auth.currentUser!.email}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () => {},
              leading: const Icon(Icons.coffee_sharp),
              title: const Text(
                'Buy us a chai',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () => {},
              leading: const Icon(Icons.question_mark_sharp),
              title: const Text(
                'About',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () => auth.signOut(),
              leading: const Icon(Icons.logout_outlined),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [
          //     Colors.redAccent,
          //     Colors.deepOrange,
          //   ],
          // ),
          color: mobileBackgroundColor,
        ),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.of(context).push(
                SwipeablePageRoute(
                  builder: (context) => const NewResturant(
                    hotelName: 'Restaurants',
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                  gradient: _colorGradient(),
                ),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Center(
                    child: Text(
                      "Restarant",
                      style: GoogleFonts.sansita(
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                SwipeablePageRoute(
                  builder: (context) => const NoPage(),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                  gradient: _colorGradient(),
                ),
                child: Center(
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.sansita(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                SwipeablePageRoute(
                  builder: (context) => const NoPage(),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                  gradient: _colorGradient(),
                ),
                child: Center(
                  child: Text(
                    "To",
                    style: GoogleFonts.sansita(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                SwipeablePageRoute(
                  builder: (context) => const NoPage(),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                  gradient: _colorGradient(),
                ),
                child: Center(
                  child: Text(
                    "The",
                    style: GoogleFonts.sansita(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                SwipeablePageRoute(
                  builder: (context) => const NoPage(),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                  gradient: _colorGradient(),
                ),
                child: Center(
                  child: Text(
                    "Beta",
                    style: GoogleFonts.sansita(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
