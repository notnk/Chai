import 'package:Chai/src/data/utils/rive.dart';
import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/presentation/enitty_tab/screens/melty.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

class NewCataPage extends StatefulWidget {
  const NewCataPage({super.key});

  @override
  State<NewCataPage> createState() => NewCataPageState();
}

class NewCataPageState extends State<NewCataPage> {
  LinearGradient _colorGradient() {
    return const LinearGradient(
      colors: [
        Colors.deepPurple,
        Colors.purple,
        Colors.pink,
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchTigger = false as rive.SMIBool;
  }

  late rive.SMIBool searchTigger;
  @override
  Widget build(BuildContext context) {
    final availWidth = (MediaQuery.of(context).size.width - 40) / 3;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Chai",
        ),
      ),
      drawer: const Drawer(),
      endDrawer: const Text("asds"),
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MeltyPage(),
                  ),
                ),
                child: Container(
                  height: 80,
                  width: availWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                    gradient: _colorGradient(),
                  ),
                  child: const Center(
                    child: Text(
                      "MeltyWay",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 80,
                width: availWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                  gradient: _colorGradient(),
                ),
                child: const Center(
                  child: Text(
                    "Kebab",
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 80,
                width: availWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                  gradient: _colorGradient(),
                ),
                child: const Center(
                  child: Text(
                    "Member",
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: 45,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: mobileSearchColor.withOpacity(0.8),
            borderRadius: const BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: (() {
                  searchTigger.change(true);
                }),
                child: SizedBox(
                  height: 36,
                  width: 36,
                  child: rive.RiveAnimation.asset(
                    'lib/src/assets/icons.riv',
                    artboard: "HOME",
                    onInit: (artboard) {
                      rive.StateMachineController controller =
                          RiveUtils.getRiveController(
                        artboard,
                        stateMachineName: 'HOME_Interactivity',
                      );
                      searchTigger =
                          controller.findSMI("active") as rive.SMIBool;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
