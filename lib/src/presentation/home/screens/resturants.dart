import 'package:asd/src/misc/colors.dart';
import 'package:asd/src/misc/global_vars.dart';
import 'package:asd/src/presentation/home/screens/chess.dart';
import 'package:asd/src/presentation/enitty/enitity_page.dart';
import 'package:flutter/material.dart';

class Resturants extends StatelessWidget {
  const Resturants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    nextPage(int index) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EntityPage(
            hotelName: hotelsName[index],
            heroTagIndex: index,
          ),
        ),
      );
    }

    chessPage() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ChessPage(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text(
          "Resturants",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              title: Text("[Sorted Based on]"),
              trailing: Icon(Icons.sort_outlined),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: hotelsName.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => nextPage(index),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                      child: ListTile(
                        leading: Hero(
                          tag: 'hero$index',
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  imagesUrl[index],
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          hotelsName[index],
                        ),
                        trailing: InkWell(
                          onLongPress: () => chessPage(),
                          onTap: () => nextPage(index),
                          child: const Icon(Icons.next_plan_outlined),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
