import 'package:flutter/material.dart';
import 'package:writenow/screens/home.dart' as Home;
import 'package:writenow/screens/settings.dart' as Settings;
import 'package:writenow/screens/editor.dart' as Editor;

void main() {
    runApp(WriteNowApp());
}

class WriteNowApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Home.Screen()
        );
    }
}