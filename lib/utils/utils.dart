import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone_usiflutter/screens/signup_screen.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  final XFile? _file =
      await _imagePicker.pickImage(source: ImageSource.gallery);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  if (kDebugMode) {
    print("No image selected");
    //return SignupScreen();
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
