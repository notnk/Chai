import 'package:asd/presentation/feature/screens/login.dart';
import 'package:flutter/material.dart';

ListView listItems(BuildContext context) {
  return ListView(
    children: [
      const DrawerHeader(
        child: null,
      ),
      ListTile(
        leading: const Icon(
          Icons.login_outlined,
          color: Colors.white,
        ),
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginWidget(),
          ),
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.account_box_outlined,
          color: Colors.white,
        ),
        title: const Text(
          "Create new account?",
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.question_mark_outlined,
          color: Colors.white,
        ),
        title: const Text(
          "How to use",
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.details_outlined,
          color: Colors.white,
        ),
        title: const Text(
          "About",
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {},
      ),
    ],
  );
}
