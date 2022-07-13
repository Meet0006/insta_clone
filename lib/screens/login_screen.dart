import 'package:flutter/material.dart';
import 'package:insta_clone_usiflutter/utils/color.dart';
import 'package:insta_clone_usiflutter/widgets/text_filed_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            //! Add Gif
            Image.asset(
              'assets/Apple.gif',
              width: 250,
              height: 250,
            ),
            Text("AppleGram",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Satisfy",
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(255, 69, 209, 142),
                          Color.fromARGB(255, 97, 56, 209),
                          Color.fromARGB(255, 230, 129, 82)
                          //add more color here.
                        ],
                      ).createShader(
                          const Rect.fromLTWH(10.0, 100.0, 200.0, 100.0)))),
            const SizedBox(
              height: 64,
            ),
            //! Add username filed
            TextFiledInput(
              hintText: "Enter email",
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            const SizedBox(
              height: 28,
            ),
            //! Add password filed
            TextFiledInput(
              hintText: "Enter password",
              textInputType: TextInputType.text,
              textEditingController: _passwordController,
              ispass: true,
            ),
            const SizedBox(
              height: 28,
            ),
            //! Add button
            InkWell(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: blueColor,
                ),
                child: const Text(
                  "Log in",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            //! Add sign up option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/insta3.png",
                  height: 22,
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(" Don't have an account?"),
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      " Sign up.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
