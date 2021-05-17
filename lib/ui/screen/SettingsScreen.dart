import 'package:flutter/material.dart';
import 'package:places/ui/screen/themes.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

bool isSwitched = false;


class _SettingsScreenState extends State<SettingsScreen> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                        child: Text('Тёмная тема ')),
                    SizedBox(
                      width: 150.0,
                    ),
                    Container(
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            print('тема');
                          });
                        },
                        activeTrackColor: Colors.yellow,
                        activeColor: Colors.orangeAccent,
                      ),
                    )
                  ],
                )),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                    child: Text('Смотреть туториал'),
                  ),
                  SizedBox(
                    width: 130.0,
                  ),
                  Container(
                    child: Icon(Icons.info),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //чтобы первая иконка не выезжала
        items: [
          BottomNavigationBarItem(
              icon: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    setState(() {
                      print('да, это меню');
                    });
                  },
                  child: Container(
                    width: 70,
                    child: Icon(
                      Icons.format_list_bulleted,
                      size: 20,
                      color: Colors.black,
                    ),
                  )),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    setState(() {
                      print('да, это карта');
                    });
                  },
                  child: Container(
                    width: 70,
                    child: Icon(
                      Icons.map,
                      size: 20,
                      color: Colors.black,
                    ),
                  )),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    setState(() {
                      print('да, это like');
                    });
                  },
                  child: Container(
                    width: 70,
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.black,
                    ),
                  )),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    setState(() {
                      print('да, это settings');
                    });
                  },
                  child: Container(
                    width: 70,
                    child: Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.black,
                    ),
                  )),
              label: '',
              backgroundColor: Colors.white)
        ],
      ),
    );
  }
}
