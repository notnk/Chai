import 'package:asd/src/misc/colors.dart';
import 'package:asd/src/misc/global_vars.dart';
import 'package:asd/src/presentation/home/screens/hotels.dart';
import 'package:asd/src/presentation/home/screens/resturants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Tab"),
        centerTitle: true,
        backgroundColor: mobileBackgroundColor,
      ),
      backgroundColor: mobileBackgroundColor,
      drawer: Drawer(
        backgroundColor: mobileBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.all(4),
              child: CircleAvatar(
                child: Text(
                  '${auth.currentUser!.displayName}',
                ),
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
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterHotels(),
                ),
              ),
              leading: const Icon(Icons.hotel_class_outlined),
              title: const Text(
                'All Hotels',
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
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              primary: true,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Resturants(),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                entitysUrl[0],
                              ),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green[100],
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: const Text(
                            "Resturants",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                entitysUrl[1],
                              ),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green[200],
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: const Text(
                            'Hairdressing',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Resturants(),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                entitysUrl[2],
                              ),
                              fit: BoxFit.fill,
                            ),
                            // borderRadius: BorderRadius.circular(15),
                            // color: Colors.green[300],
                          ),
                          padding: const EdgeInsets.all(8),
                          // child: const Center(
                          //   child: Text(
                          //     "Nothing",
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Resturants(),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                entitysUrl[2],
                              ),
                              fit: BoxFit.fill,
                            ),
                            // borderRadius: BorderRadius.circular(15),
                            // color: Colors.green[400],
                          ),
                          padding: const EdgeInsets.all(8),
                          // child: const Center(
                          //   child: Text(
                          //     "Nothing",
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Resturants(),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                entitysUrl[2],
                              ),
                              fit: BoxFit.fill,
                            ),
                            // borderRadius: BorderRadius.circular(15),
                            // color: Colors.green[500],
                          ),
                          padding: const EdgeInsets.all(8),
                          // child: const Center(
                          //   child: Text(
                          //     "Nothing",
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Resturants(),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                entitysUrl[2],
                              ),
                              fit: BoxFit.fill,
                            ),
                            // borderRadius: BorderRadius.circular(15),
                            // color: Colors.green[600],
                          ),
                          padding: const EdgeInsets.all(8),
                          // child: const Center(
                          //   child: Text(
                          //     "Nothing",
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                    ],
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
