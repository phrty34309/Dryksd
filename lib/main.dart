import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/SightDetails.dart';
import 'package:places/ui/screen/VisitingScreen.dart';
import 'package:places/ui/screen/themes.dart';
import 'package:places/ui/screen/FiltersScreen.dart';
import 'package:places/ui/screen/SettingsScreen.dart';
import 'package:provider/provider.dart';
import 'package:places/ui/screen/AddSightScreen.dart';
import 'package:places/ui/screen/SightSearchScreen.dart';
import 'package:places/ui/screen/Category.dart';


void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with ChangeNotifier {
  var isDarkMode = false;

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'Интересные места',
        theme: isDarkMode == false? lightTheme : darkTheme,
        // вот здесь не норм //isDarkMode ? darkTheme : lightTheme,
        home: Stack(children: <Widget>[
          Visiting(), //  SightListScreen(),//SettingsScreen(),//  Category(),//SightDetails(mocks[0]),//FilterScreen(),//SightSearchScreen(),//AddSight(), // SettingsScreen(),
          Container(
              width: 65,
              margin: EdgeInsets.fromLTRB(275.0, 490.0, 16.0, 6.0),
              child: ElevatedButton(
                /*shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),*/
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
