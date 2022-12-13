import 'package:asd/presentation/screens/payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/googleSignin.dart';
import '../screens/hotels.dart';

ListView drawerForDashboard(BuildContext context) {
  final FirebaseAuth auth = FirebaseAuth.instance;
  return ListView(
    children: [
      const DrawerHeader(
        margin: EdgeInsets.all(4),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1618042164219-62c820f10723?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dW5zcGFsc2h8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(Icons.email_outlined),
        title: Text(
          '${auth.currentUser!.email}', //will be later updated to user display name
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
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MyApp(),
          ),
        ),
        leading: const Icon(Icons.hotel_class_outlined),
        title: const Text(
          'Test Payments',
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
      ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const GoogleSignIn(),
          ),
        ),
        leading: const Icon(Icons.logout_outlined),
        title: const Text(
          'Sign in using google',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
