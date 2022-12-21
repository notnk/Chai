import 'package:asd/src/presentation/features/login/login.dart';
import 'package:flutter/material.dart';
import '../../../../../misc/colors.dart';
import '../../../../../misc/global_vars.dart';

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: mobileBackgroundColor,
        child: ListView(
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
        ),
      ),
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "New Offers",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: imagesUrl.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            width: double.infinity,
            child: Image.network(
              imagesUrl[index],
            ),
          );
        },
      ),
    );
  }
}
