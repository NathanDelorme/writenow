import 'package:flutter/material.dart';
import 'package:writenow/models/Search.dart';

class Screen extends StatefulWidget {
  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<Screen> {
  final List<String> list = List.generate(100, (index) => "Note $index");
  final List<String> displayedList = new List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          searchBarUI(),
        ]
      ),
    );
  }

  Widget searchBarUI() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 6,
            spreadRadius: 2,
            color: Color(0xFFE6E6E6),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          icon: Icon(Icons.search),
          border: InputBorder.none,
        ),
        onSubmitted: (String value) async {
          await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Search'),
                content: Text('You search "$value". There is ${ (list.where((element) => element.contains(value))).length } in the list.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () { Navigator.pop(context); },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}