import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:writenow/screens/home.dart' as Home;
import 'package:writenow/screens/edition.dart' as Edition;
import 'package:writenow/screens/settings.dart' as Settings;

void main() {
  runApp(WriteNowApp());
}

class WriteNowApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primaryColor: Colors.white,
        shadowColor: Color(0xFFE6E6E6),
        fontFamily: 'Verdana',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFF4A4A4A)),
          bodyText2: TextStyle(color: Color(0xFF636363)),
        ),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF1C1C1C),
        shadowColor: Color(0xFF1C1C1C),
        fontFamily: 'Verdana',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFFD6D6D6)),
          bodyText2: TextStyle(color: Color(0xFFC2C2C2)),
        ),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title : "WriteNow",
        theme: theme,
        darkTheme: darkTheme,
        home : Home.Screen(),
      ),
    );
  }
}