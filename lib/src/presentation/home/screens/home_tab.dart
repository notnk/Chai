// import 'package:Chai/src/misc/colors.dart';
// import 'package:Chai/src/misc/global_vars.dart';
// import 'package:Chai/src/presentation/enitty_tab/screens/resturant.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:swipeable_page_route/swipeable_page_route.dart';

// class HomeTab extends StatefulWidget {
//   const HomeTab({Key? key}) : super(key: key);

//   @override
//   State<HomeTab> createState() => _HomeTabState();
// }

// class _HomeTabState extends State<HomeTab> {
//   @override
//   Widget build(BuildContext context) {
//     final FirebaseAuth auth = FirebaseAuth.instance;

//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           GestureDetector(
//             onTap: () => auth.signOut(),
//             child: const CircleAvatar(
//               backgroundImage: AssetImage("lib/src/assets/chai.jpg"),
//             ),
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//         ],
//         title: const Text("Chai logo text"),
//         centerTitle: true,
//         backgroundColor: mobileBackgroundColor,
//       ),
//       backgroundColor: mobileBackgroundColor,
//       drawer: Drawer(
//         backgroundColor: mobileBackgroundColor,
//         child: ListView(
//           children: [
//             DrawerHeader(
//               margin: const EdgeInsets.all(4),
//               child: CircleAvatar(
//                 child: Text(
//                   '${auth.currentUser!.displayName}',
//                 ),
//               ),
//             ),
//             ListTile(
//               onTap: () {},
//               leading: const Icon(Icons.email_outlined),
//               title: Text(
//                 '${auth.currentUser!.email}',
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//             ListTile(
//               onTap: () => auth.signOut(),
//               leading: const Icon(Icons.logout_outlined),
//               title: const Text(
//                 'Logout',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             // color: Colors.amber,
//             height: 100,
//             child: Row(
//               children: [
//                 Container(
//                   color: Colors.red,
//                   width: 50,
//                   child: const Center(
//                     child: Text("Offer"),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   color: Colors.red,
//                   width: 50,
//                   child: const Center(
//                     child: Text("Offer"),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   color: Colors.red,
//                   width: 50,
//                   child: const Center(
//                     child: Text("Offer"),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   color: Colors.red,
//                   width: 50,
//                   child: const Center(
//                     child: Text("Offer"),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   color: Colors.red,
//                   width: 50,
//                   child: const Center(
//                     child: Text("Offer"),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Container(
//                   color: Colors.red,
//                   width: 20,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             child: CustomScrollView(
//               primary: true,
//               slivers: <Widget>[
//                 SliverPadding(
//                   padding: const EdgeInsets.all(20),
//                   sliver: SliverGrid.count(
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 20,
//                     crossAxisCount: 2,
//                     children: <Widget>[
//                       GestureDetector(
//                         onTap: () => Navigator.of(context).push(
//                           SwipeablePageRoute(
//                             builder: (context) => const NewResturant(
//                               hotelName: 'Resturants',
//                             ),
//                           ),
//                         ),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 "lib/src/assets/Restaurant.png",
//                               ),
//                               fit: BoxFit.fill,
//                             ),
//                             borderRadius: BorderRadius.circular(30),
//                             // color: const Color.fromARGB(255, 232, 93, 50),
//                             color: blueColor,
//                           ),
//                           child: const Center(
//                             child: Text(
//                               "Resturants",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => {},
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 "lib/src/assets/Barber.png",
//                               ),
//                               fit: BoxFit.fill,
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                             color: Colors.brown,
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Hairdressing',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => {},
//                         child: Container(
//                           decoration: BoxDecoration(
//                             // shape: BoxShape.circle,
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                 entitysUrl[2],
//                               ),
//                               fit: BoxFit.fill,
//                             ),
//                             // borderRadius: BorderRadius.circular(15),
//                             // color: Colors.green[400],
//                           ),
//                           padding: const EdgeInsets.all(8),
//                           // child: const Center(
//                           //   child: Text(
//                           //     "Nothing",
//                           //     style: TextStyle(
//                           //       color: Colors.black,
//                           //       fontSize: 20,
//                           //       fontWeight: FontWeight.w500,
//                           //     ),
//                           //   ),
//                           // ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => {},
//                         child: Container(
//                           decoration: BoxDecoration(
//                             // shape: BoxShape.circle,
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                 entitysUrl[2],
//                               ),
//                               fit: BoxFit.fill,
//                             ),
//                             // borderRadius: BorderRadius.circular(15),
//                             // color: Colors.green[500],
//                           ),
//                           padding: const EdgeInsets.all(8),
//                           // child: const Center(
//                           //   child: Text(
//                           //     "Nothing",
//                           //     style: TextStyle(
//                           //       color: Colors.black,
//                           //       fontSize: 20,
//                           //       fontWeight: FontWeight.w500,
//                           //     ),
//                           //   ),
//                           // ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () => {},
//                         child: Container(
//                           decoration: BoxDecoration(
//                             // shape: BoxShape.circle,
//                             image: DecorationImage(
//                               image: NetworkImage(
//                                 entitysUrl[2],
//                               ),
//                               fit: BoxFit.fill,
//                             ),
//                             // borderRadius: BorderRadius.circular(15),
//                             // color: Colors.green[600],
//                           ),
//                           padding: const EdgeInsets.all(8),
//                           // child: const Center(
//                           //   child: Text(
//                           //     "Nothing",
//                           //     style: TextStyle(
//                           //       color: Colors.black,
//                           //       fontSize: 20,
//                           //       fontWeight: FontWeight.w500,
//                           //     ),
//                           //   ),
//                           // ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
