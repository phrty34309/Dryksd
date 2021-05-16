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

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with ChangeNotifier {
  var isDarkMode = false;
  var values = ValueFromSettings();

  @override
  Widget build(BuildContext context) {

    values.addListener(() {
      ValueFromSettings.getBool();
    });

    return MaterialApp(
        title: 'Интересные места',
        theme: ValueFromSettings.getBool() == false? darkTheme : lightTheme,
        // вот здесь не норм //isDarkMode ? darkTheme : lightTheme,
        home: Stack(children: <Widget>[
          FilterScreen(), //Visiting(), //SightDetails(mocks[0]),// SettingsScreen(),SightListScreen(),
          Container(
              width: 65,
              margin: EdgeInsets.fromLTRB(275.0, 490.0, 16.0, 6.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  setState(
                    () {
                      isDarkMode = !isDarkMode;
                      ValueFromSettings
                          .getBool(); // в общем переключаю свитчер в SettingsScreen, а потом эту кнопку и тема меняется. Обратно таким же макаром.
                      print(ValueFromSettings
                          .getBool()); // это для проверки , тут все норм. Нажимаешь свитчер в SettingsScreen тут true, опять нажимаешь свитчер - false.
                    },
                  );
                },
                child: Text(isDarkMode ? 'To Light' : 'To Dark'),
              ))
        ]));
  }
}
