import 'package:asd/src/data/repo/auth_methods.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final int amount;
  final String hotelName;

  const SubmitButton({Key? key, required this.amount, required this.hotelName})
      : super(key: key);

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  final TextEditingController _textEditingController = TextEditingController();
  checkCode() {
    final code = _textEditingController.text;
    final int codeInt = int.parse(code);
    if (codeInt > 1000) {
      AuthMethods().checkCode(
        amount: widget.amount,
        codeGet: codeInt,
        context: context,
        hotelName: widget.hotelName,
      ); //checking for correct code and adding coin if correct code is entred
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          content: Text('Code was Wrong!'),
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
      appBar: AppBar(
        title: const Text("Ask the member to enter the code"),
        elevation: 0,
      ),
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
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Code',
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                labelText: 'Enter code',
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
              onTap: () => checkCode(),
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
}
