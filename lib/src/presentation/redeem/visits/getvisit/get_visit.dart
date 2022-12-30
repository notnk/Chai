import 'package:Chai/src/misc/colors.dart';
import 'package:Chai/src/presentation/redeem/coins/get_coin/submit_get_coin.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class GetVisit extends StatefulWidget {
  final String hotelName;
  const GetVisit({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<GetVisit> createState() => _GetVisitState();
}

class _GetVisitState extends State<GetVisit> {
  final TextEditingController _textEditingController = TextEditingController();
  checkAmount() {
    final amount = _textEditingController.text;
    final int amountInt = int.parse(amount);
    if (amountInt > 100) {
      Navigator.of(context).pushReplacement(
        SwipeablePageRoute(
          builder: (context) => SubmitGetCoin(
            amount: amountInt,
            hotelName: widget.hotelName,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          content: Text('Enter money man(>100)!'),
        ),
      );
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
              "Enter you amount below of ${widget.hotelName}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                hintText: 'Amount',
                labelText: 'Enter amount',
                fillColor: Colors.grey,
                filled: true,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () => checkAmount(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
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

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }
}
