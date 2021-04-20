import 'package:flutter/material.dart';


class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: new AppBar(
        title: new Text("My Places"),
      ),

    );
  }
}
