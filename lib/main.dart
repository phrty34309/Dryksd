import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/SightDetails.dart';
import 'package:places/ui/screen/VisitingScreen.dart';
import 'package:places/ui/screen/themes.dart';
import 'package:places/ui/screen/FiltersScreen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Интересные места',
        theme: isDarkMode ? darkTheme : lightTheme,
        home: Stack(children: <Widget>[
          FilterScreen(),//SightDetails(mocks[0]),//SightListScreen(),//Visiting(),
          Container(width: 65,
              margin: EdgeInsets.fromLTRB(275.0, 490.0, 16.0, 6.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  setState(
                    () {
                      isDarkMode = !isDarkMode;
                    },
                  );
                },
                child: Text(isDarkMode ? 'To Light' : 'To Dark'),
              ))
        ]));
  }
}

