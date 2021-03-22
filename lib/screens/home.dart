import 'package:flutter/material.dart';
import 'package:writenow/models/note.dart';
import 'package:writenow/screens/settings.dart' as Settings;
import 'package:writenow/screens/edition.dart' as Edition;
import 'package:adaptive_theme/adaptive_theme.dart';

class Screen extends StatefulWidget {
  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<Screen> {
  final List<Note> list = [ new Note("Insa", "Habuit adpetentem debuerunt patriam illi Coriolanus debuerunt quatenus placet habuit Numne habuit rem ob videamus."),
    new Note("Concours", "Coactique aliquotiens nostri pedites ad eos persequendos scandere clivos sublimes etiam si lapsantibus plantis fruticeta prensando vel dumos ad vertices venerint summos, inter arta tamen et invia nullas acies explicare permissi nec firmare nisu valido gressus: hoste discursatore rupium abscisa volvente, ruinis ponderum inmanium consternuntur, aut ex necessitate ultima fortiter dimicante, superati periculose per prona discedunt."),
    new Note("Mots anglais", "Efferebantur quam comes et in desperatio incendebat efferebantur sudoribus tuebatur Castricius comes saeviore saeviore Castricius comes tresque sudoribus rabie viribus desperatio saeviore induratae quam matris tuebatur incendebat in viribus Castricius."),
    new Note("Anniversaire", "Excusatio consuetudo curriculoque locati se ut Fanni Turpis Turpis tum."),
    new Note("CCP", "Arva tractus Assyriis rebus: tractus."),
    new Note("Ada") ];
  final List<Note> displayedList = [  ];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButtonUI(),

      body: Center(
        child: Scrollbar(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length + 1,
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0)
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 80.0),
                      searchBarUI(),
                      settingsButtonUI(),
                    ],
                  ),
                );
              return noteUI(index-1);
            },
          ),
        ),
      ),
    );
  }

  Widget floatingButtonUI() {
    return FloatingActionButton(
      onPressed: () => setState(() {
        print("Note added");
        list.add(new Note("Note " + list.length.toString()));
      }),
      child: Icon(Icons.add),
      backgroundColor: Color(0xFF9C9C9C),
    );
  }

  Widget noteUI(int index) {
    return
      GestureDetector(
        onTap: () {
          print("Modifer la note : " + list[index].getName());
        },
      child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 6,
            spreadRadius: 2,
            color: Theme.of(context).shadowColor,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                list[index].getName(),
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                list[index].getDate().hour.toString() + ":" + list[index].getDate().minute.toString(),
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2.color,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            list[index].getContent(),
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                list[index].getDate().day.toString() + "/" + list[index].getDate().month.toString() + "/" + list[index].getDate().year.toString(),
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2.color,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
      ));
  }

  Widget searchBarUI() {
    return Expanded(
      child : Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 6,
              spreadRadius: 2,
              color: Theme.of(context).shadowColor,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            icon: Icon(Icons.search, color: Theme.of(context).textTheme.bodyText2.color,),
            border: InputBorder.none,
          ),
          onSubmitted: (String value) async {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                title: Text('Search'),
                content: Text('You search "$value". There is ${ (list.where((element) => element.getName().toLowerCase().contains(value.toLowerCase()))).length } in the list.'),
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
      ),
    );
  }

  Widget settingsButtonUI() {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 6,
            spreadRadius: 2,
            color: Theme.of(context).shadowColor,
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          color: Theme.of(context).primaryColor,
          child: InkWell(
            splashColor: Theme.of(context).shadowColor,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.settings,
                color: Theme.of(context).textTheme.bodyText2.color,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Settings.Screen())));
            },
          ),
        ),
      )
    );
  }
}