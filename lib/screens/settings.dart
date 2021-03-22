import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Screen extends StatefulWidget {
  @override
  SettingsScreen createState() => SettingsScreen();
}

class SettingsScreen extends State<Screen> {
  bool isLigth = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
                  Navigator.pop(context);
                }),
                IconButton(icon: (isLigth) ? Icon(Icons.wb_sunny) : Icon(Icons.nightlight_round), onPressed: () {
                  setState(() {
                    isLigth = !isLigth;
                    AdaptiveTheme.of(context).toggleThemeMode();
                  });
                }),
              ],
            ),
          ),
          SizedBox(height: 100.0),
          Center(
            child: Text(
              "Developped by Nathan Delorme\nContact : nathandelorme2001@gmail.com",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}