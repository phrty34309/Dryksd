import 'package:flutter/material.dart';
import 'package:places/ui/screen/SightSearchScreen.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/SettingsScreen.dart';
import 'package:places/ui/screen/AddSightScreen.dart';
import 'package:places/ui/screen/FiltersScreen.dart';

//import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: MyCustomAppBar(
        height: 175,
      ),
      body: Stack(children: <Widget>[
        Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: mocks.length,
              itemBuilder: (BuildContext context, int index) {
                return SightCard(mocks[index]);
              }),
        ),
        Container(
            width: 165,
            margin: EdgeInsets.fromLTRB(85.0, 293.0, 16.0, 6.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddSight()));
              },
              child: Container(
                  child: Row(children: <Widget>[
                SizedBox(
                  width: 14,
                ),
                Text(
                  'Новое место',
                ),
                Icon(Icons.add_circle_outline)
              ])),
            )),
      ]),
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
                      print('settings');
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

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
          child: Text(
            "Список интересных мест",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: const Color(0xFF3B3E5B),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: Colors.grey[300],
          child: Center(
            //padding: EdgeInsets.all(0),
            child: AppBar(
              elevation: 0.0,
              title: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SightSearchScreen()));
                  },
                  child: Container(
                    color: Colors.white,
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SightSearchScreen()));
                          },
                        ),
                        hintText: "Поиск",
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  )),
              actions: [
                IconButton(
                  color: Colors.black,
                  icon: IconButton(icon: Icon(Icons.filter_list)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => FilterScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
