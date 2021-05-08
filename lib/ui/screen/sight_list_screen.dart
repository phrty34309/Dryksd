import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';

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
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              title: Text(
                "Список\nинтересных мест",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: const Color(0xFF3B3E5B),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              toolbarHeight: 120,
              elevation: 0.0, //убрал тень
              backgroundColor: Colors.white,
            )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          SightCard(mocks[0]),
          SightCard(mocks[1]),
          SightCard(mocks[2])
        ])));
  }
}
