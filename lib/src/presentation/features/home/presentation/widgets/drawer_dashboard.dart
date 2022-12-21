import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screens/hotels.dart';

ListView drawerForDashboard(BuildContext context) {
  final FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignInAccount? currentUser;

  final GoogleSignInAccount? user = currentUser;

  return ListView(
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
  );
}
