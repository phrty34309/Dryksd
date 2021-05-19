//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/AddSightScreen.dart';
import 'package:places/ui/screen/Category.dart';
import 'package:places/ui/screen/SightDetails.dart';
import 'package:places/ui/screen/FiltersScreen.dart';
import 'dart:math';


class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  List forLooter = [];

  String nameForTextField;
  List resultForTextField = [];

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  //color: Colors.green,
                  width: 300, height: 50,
                  //margin: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.only(top: 23.0),
                    child: Text(
                      "Список интересных мест",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  //color: Colors.yellow,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 300,
                        color: Colors.white,
                        child: TextField(
                          controller: _controller,
                          onChanged: (_controller) {
                            for (var i in mocks) {
                              if (i.name.contains(_controller) &&
                                      _controller.length > 2 ||
                                  i.name.contains(' ' + _controller) &&
                                      _controller.length > 3 ||
                                  i.name.contains('  ' + _controller) &&
                                      _controller.length > 3) {
                                //  if (_controller == '') {
                                //    continue;
                                //  }

                                // if (_controller == ' ') {
                                //  continue;
                                // }

                                nameForTextField = i.name;
                                resultForTextField = funcForTextField(forLooter,
                                    nameForTextField); // forLooter ключевая. Дальше именно она используется везде
                              }
                            }

                            setState(() {
                              resultForTextField =
                                  resultForTextField; // это чтобы только в forLooter данные прошли
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Введите текст",
                              contentPadding: EdgeInsets.all(5),
                              suffix: IconButton(
                                icon: Icon(Icons.backspace),
                                onPressed: () {
                                  _controller.text =
                                      ' '; // в TextField наверх.Очищает как бы текст в поиске
                                },
                              )),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          color: Colors.black,
                          icon: Icon(Icons.filter_list),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        FilterScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            height: 350,
            child: ListView.builder(
                padding: const EdgeInsets.all(4),
                itemCount: forLooter.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => SightDetails(
                                    funcForSightDetails(
                                        mocks, forLooter[index]))));
                      },
                      child: Container(
                          width: 100,
                          height: 70,
                          child: Stack(children: [
                            Text(forLooter[index]),
                            Center(
                                child: CircularProgressIndicator(
                                    value: forLooter.isEmpty ? null : 0.001)),
                          ]))); //SightCard(forLooter2[index]);
                }),
          ),
          Container(
            padding: EdgeInsets.only(top: 0.0),
            child: InkWell(
                onTap: () {
                  setState(() {
                    forLooter.clear();
                  });
                },
                child: Container(
                    width: 200,
                    height: 35,
                    child: Text(
                      'очистить историю',
                    ))),
          ),
        ],
      )), //tyt
    );
  }
}

funcForSightDetails(mass, word) {
  //фунция определяет экран SightDetails. То есть какой экран откроется.
  var point;
  for (var i in mass) {
    if (i.name.contains(word)) {
      point = i;
    }
  }
  return point;
}

List funcForTextField(data, word) {
  var radius;

  //для TextField чтобы не повторялись названия мест
  if (data.contains(word) == false) {
    data.add(word);
    //data.sort();
  }
  return data;
}

