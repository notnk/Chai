import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../data/colors.dart';
import '../../../../../data/global_vars.dart';
import '../widgets/drawer_dashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _page = 0;
  final PageController _pageController = PageController();
  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        backgroundColor: Colors.deepOrangeAccent,
        child: drawerForDashboard(context),
      ),
      appBar: AppBar(
        // leading: InkWell(
        //   onTap: () {},
        //   child: const Icon(Icons.search_outlined),
        // ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.qr_code_scanner_outlined,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          // InkWell(
          //   onTap: () {},
          //   child: const Icon(
          //     Icons.notification_important_outlined,
          //   ),
          // ),
          const SizedBox(
            width: 10,
          )
        ],
        backgroundColor: mobileBackgroundColor,
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: navigationTapped,
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _page == 0 ? Icons.home_filled : Icons.home_outlined,
              color: _page == 0 ? Colors.red : Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page == 1
                  ? Icons.trending_down_outlined
                  : Icons.trending_up_outlined,
              color: _page == 1 ? Colors.red : Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page == 2 ? Icons.scoreboard_rounded : Icons.scoreboard_outlined,
              color: _page == 2 ? Colors.red : Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page == 3
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_outlined,
              color: _page == 3 ? Colors.red : Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page == 4
                  ? Icons.person_off_rounded
                  : Icons.person_outline_sharp,
              color: _page == 4 ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
      body: PageView(
        // physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
    );
  }
}
