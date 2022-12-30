import 'package:Chai/src/misc/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewHomePage extends StatelessWidget {
  const NewHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.redAccent,
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 21,
            backgroundImage: NetworkImage(imagesUrl[0]),
          ),
          const SizedBox(
            width: 20,
          )
        ],
        title: Text(
          "Chai",
          style: GoogleFonts.caramel(
            fontSize: 50,
            color: Colors.black,
          ),
        ),
      ),
      drawer: const Drawer(),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Container(
              color: Colors.red,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (BuildContext contex, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                // child: Scroll,
              );
            },
          ),
        ],
      ),
    );
  }
}
