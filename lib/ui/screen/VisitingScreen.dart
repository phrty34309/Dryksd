import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

class Visiting extends StatefulWidget {
  @override
  _VisitingState createState() => _VisitingState();
}

class _VisitingState extends State<Visiting> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.white,
            elevation: 0.0,
            toolbarHeight: 156,
            bottom: PreferredSize(
                preferredSize: Size(100.0, 200.0),
                child: Container(
                    margin: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 30.0),
                    width: 328,
                    height: 40,
                    child: TabBar(
                        unselectedLabelColor: Colors.redAccent,
                        indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                        indicator: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.redAccent, Colors.orangeAccent]),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueAccent,
                        ), //redAccent),
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Хочу посетить"),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Посетил"),
                            ),
                          )
                        ]))),
            title: Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                width: 360,
                height: 56,
                child: Center(
                    child: Text(
                  "Избранное",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: const Color(0xFF3B3E5B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ))),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
                child: Column(children: <Widget>[
              (SightCard(mocks[0])),
              SightCard(mocks[2])
            ])),
            SingleChildScrollView(
                child: Column(children: <Widget>[(SightCard(mocks[1]))])),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.format_list_bulleted,
                    size: 20,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.map,
                    size: 20,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 20,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.white)
            ],
          ),
        ));
  }
}
