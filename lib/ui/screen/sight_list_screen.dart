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
          title: RichText(
              text: TextSpan(
                  text: 'С',
                  style: TextStyle(
                      color: Colors.amber, //amber
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                    text: 'писок \n',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: 'И',
                          style: TextStyle(
                              color: Colors.yellowAccent, //yellowAccent
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: 'нтересных',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: ' мест',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])
                          ])
                    ])
              ])),
          backgroundColor: Colors.white,
        ));
  }
}
