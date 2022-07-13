import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Instagram(w)",
        style: TextStyle(fontFamily: 'Satisfy',fontSize: 30),
      )),
    );
  }
}
