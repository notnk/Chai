import 'package:Chai/src/data/services/update_values.dart';
import 'package:Chai/src/misc/colors.dart';
import 'package:flutter/material.dart';

class GetCoin extends StatefulWidget {
  final String hotelName;
  const GetCoin({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<GetCoin> createState() => _GetCoinState();
}

class _GetCoinState extends State<GetCoin> {
  final TextEditingController _amountEditingController =
      TextEditingController();
  final TextEditingController _codeEditingController = TextEditingController();
  checkAmount() async {
    final amount = int.parse(_amountEditingController.text.trim());
    final code = int.parse(_codeEditingController.text.trim());
    if (amount > 100 && amount < 2000) {
      String res = await UpdateValues().addValues(
          hotelName: widget.hotelName,
          enteredCode: code,
          enteredAmount: amount);
      if (res != 'succ') {
        showDialog(
          barrierLabel: "Error",
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            content: Text('Wrong code'),
          ),
        );
      } else {
        if (mounted) {
          Navigator.of(context).pop();
        }
        showDialog(
          barrierLabel: "Success",
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            content: Text('Coin and Vists have been added'),
          ),
        );
      }
    } else {
      showDialog(
        barrierLabel: "Error",
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          content: Text('Min amount is 100'),
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
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Text(
              widget.hotelName,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            TextField(
              controller: _amountEditingController,
              decoration: InputDecoration(
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                hintText: 'Less than 2000',
                labelText: 'Enter amount',
                fillColor: Colors.white10,
                filled: true,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 60,
            ),
            TextField(
              controller: _codeEditingController,
              obscureText: true,
              decoration: InputDecoration(
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                hintText: 'Code',
                labelText: 'Enter code',
                fillColor: Colors.white10,
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

  @override
  void dispose() {
    super.dispose();
    _amountEditingController.dispose();
    _codeEditingController.dispose();
  }
}
