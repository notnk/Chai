// import 'package:Chai/src/data/db_calls/auth_methods.dart';
// import 'package:Chai/src/misc/colors.dart';
// import 'package:Chai/src/presentation/redeem/succ.dart';
// import 'package:flutter/material.dart';
// import 'package:swipeable_page_route/swipeable_page_route.dart';

// class SubmitGetCoin extends StatefulWidget {
//   final int amount;
//   final String hotelName;

//   const SubmitGetCoin({Key? key, required this.amount, required this.hotelName})
//       : super(key: key);

//   @override
//   State<SubmitGetCoin> createState() => _SubmitGetCoinState();
// }

// class _SubmitGetCoinState extends State<SubmitGetCoin> {
//   final TextEditingController _textEditingController = TextEditingController();
//   checkCode() async {
//     final code = _textEditingController.text;
//     final int codeInt = int.parse(code);
//     if (codeInt > 1000 && codeInt > 1001) {
//       String res = await AuthMethods().checkCodeToAddCoin(
//         amount: widget.amount,
//         codeGet: codeInt,
//         hotelName: widget.hotelName,
//       );
//       if (res == 'succ') {
//         if (mounted) {
//           Navigator.of(context).pushReplacement(
//             SwipeablePageRoute(
//               builder: (context) => SuccPage(hotelName: widget.hotelName),
//             ),
//           );
//         }
//       }
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) => const AlertDialog(
//           content: Text('Code was Wrong in submit page!'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final inputBorder = OutlineInputBorder(
//       borderSide: Divider.createBorderSide(context),
//     );
//     return Scaffold(
//       backgroundColor: mobileBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: mobileBackgroundColor,
//         title: const Text("Ask the member to enter the code"),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Flexible(
//               flex: 1,
//               child: Container(),
//             ),
//             Text(
//               "Enter you code below for hotel ${widget.hotelName}",
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 100,
//             ),
//             SizedBox(
//               width: 200,
//               child: TextField(
//                 controller: _textEditingController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Code',
//                   focusedBorder: inputBorder,
//                   enabledBorder: inputBorder,
//                   labelText: 'Enter code',
//                   fillColor: Colors.white10,
//                   filled: true,
//                   border: InputBorder.none,
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             const SizedBox(
//               height: 60,
//             ),
//             InkWell(
//               onTap: () => checkCode(),
//               child: Container(
//                 width: 100,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.blue,
//                 ),
//                 child: const Center(
//                   child: Text("Submit"),
//                 ),
//               ),
//             ),
//             Flexible(
//               flex: 2,
//               child: Container(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
