import 'package:flutter/material.dart';


class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        toolbarHeight: 120, //  высоту
        elevation: 0.0, //убрал тень
        title: new Text("Список\nинтересных мест",
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),

    );
  }
}
