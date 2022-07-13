import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone_usiflutter/resources/auth_methods.dart';
import 'package:insta_clone_usiflutter/utils/color.dart';
import 'package:insta_clone_usiflutter/utils/utils.dart';
import 'package:insta_clone_usiflutter/widgets/text_filed_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List imn = await pickImage(ImageSource.gallery);
    setState(() {
      _image = imn;
    });
  }

  Future<void> signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            //! Add image

            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage: AssetImage("assets/skull.jpg"),
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    iconSize: 30,
                    onPressed: selectImage,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
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
              height: 10,
            ),
            const Text(
              "Welcome our Community",
              style: TextStyle(fontSize: 13, fontFamily: "Satisfy"),
            ),
            const SizedBox(
              height: 28,
            ),
            //! Add username filed
            TextFiledInput(
              hintText: "Enter username",
              textInputType: TextInputType.text,
              textEditingController: _usernameController,
            ),
            const SizedBox(
              height: 22,
            ),
            TextFiledInput(
              hintText: "Enter email",
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            const SizedBox(
              height: 22,
            ),
            //! Add password filed
            TextFiledInput(
              hintText: "Enter password",
              textInputType: TextInputType.text,
              textEditingController: _passwordController,
              ispass: true,
            ),
            const SizedBox(
              height: 22,
            ),
            TextFiledInput(
              hintText: "Enter bio",
              textInputType: TextInputType.text,
              textEditingController: _bioController,
            ),
            const SizedBox(
              height: 22,
            ),
            //! Add button
            InkWell(
              onTap: signUpUser,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: blueColor,
                ),
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        "Sign up",
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
                  child: const Text("   @Powerd by applegram."),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
