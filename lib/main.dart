import 'package:flutter/material.dart';
import 'package:writenow/screens/home.dart' as Home;

void main() {
  runApp(WriteNowApp());
}

class WriteNowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : "WriteNow",
      home : Home.Screen(),
    );
  }
}