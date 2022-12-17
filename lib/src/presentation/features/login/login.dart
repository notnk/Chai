import 'package:asd/src/misc/colors.dart';
import 'package:asd/src/data/repo/auth_methods.dart';
import 'package:asd/src/presentation/features/login/text_field_input.dart';

import 'package:flutter/material.dart';

import '../home/presentation/screens/dashboard.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  loginUserOnTap() async {
    String res = await AuthMethods().loginUser(
      email: _emailEditingController.text,
      password: _passwordEditingController.text,
    );
    if (res == "succ") {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("LOGIN"),
          centerTitle: true,
          backgroundColor: secondaryColor,
          elevation: 0,
        ),
        backgroundColor: secondaryColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              TextFieldInput(
                textEditingController: _emailEditingController,
                hintText: "Email",
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _passwordEditingController,
                hintText: "Password",
                isPass: true,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => loginUserOnTap(),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                  child: const Text("LOGIN"),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
  }
}
