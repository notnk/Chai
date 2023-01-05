import 'package:Chai/src/data/services/update_values.dart';
import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/presentation/redeem/succ.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class SubmitUseCoin extends StatefulWidget {
  final int offerCoin;
  final String hotelName;

  const SubmitUseCoin(
      {Key? key, required this.offerCoin, required this.hotelName})
      : super(key: key);

  @override
  State<SubmitUseCoin> createState() => _SubmitUseCoinState();
}

class _SubmitUseCoinState extends State<SubmitUseCoin> {
  final TextEditingController _textEditingController = TextEditingController();
  checkCode() async {
    final code = int.parse(_textEditingController.text);
    if (code > 1000) {
      String res = await UpdateValues().minusValues(
        offerPrice: widget.offerCoin,
        enteredCode: code,
        hotelName: widget.hotelName,
      );
      if (res == 'succ') {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            SwipeablePageRoute(
              builder: (context) => SuccPage(hotelName: widget.hotelName),
            ),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            content: Text('Process was not complete'),
          ),
        );
      } //checking for correct code and adding coin if correct code is entred
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Text(
              "Enter you code below for hotel ${widget.hotelName}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _textEditingController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Code',
                  focusedBorder: inputBorder,
                  enabledBorder: inputBorder,
                  labelText: 'Enter code',
                  fillColor: Colors.white10,
                  filled: true,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () => checkCode(),
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text("Submit"),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
