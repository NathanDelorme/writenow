import 'package:flutter/material.dart';
import 'package:writenow/models/Search.dart';

class Screen extends StatefulWidget {
  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<Screen> {
  final List<String> list = List.generate(100, (index) => "Note $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF454545),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: Search(list));
          },
          icon: Icon(Icons.search),
        ),
      ],
      centerTitle: false,
      title: Text("Rechercher"),
    );
  }
}