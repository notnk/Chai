import 'package:asd/src/misc/global_vars.dart';
import 'package:asd/src/presentation/features/home/presentation/screens/enitity_page.dart';
import 'package:flutter/material.dart';

class Resturants extends StatelessWidget {
  const Resturants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final count = AuthMethods().getEnitiyListNo('hotels');
    return Scaffold(
      appBar: AppBar(
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
              title: Text("Sorted Based on"),
              trailing: Icon(Icons.sort_outlined),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: hotelsName.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                    child: ListTile(
                      leading: Image.network(
                        imagesUrl[index],
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                      title: Text(hotelsName[index]),
                      trailing: IconButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EntityPage(
                              hotelName: hotelsName[index],
                            ),
                          ),
                        ),
                        icon: const Icon(Icons.next_plan_outlined),
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
