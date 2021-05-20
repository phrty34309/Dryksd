//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/AddSightScreen.dart';
import 'package:places/ui/screen/Category.dart';
import 'package:places/ui/screen/SightDetails.dart';
import 'package:places/ui/screen/FiltersScreen.dart';
import 'dart:math';
import 'package:places/domain/sight.dart';
import 'package:collection/collection.dart'; //не пригодился, потом пригодится
import 'package:unique_list/unique_list.dart'; //не пригодился, потом пригодится

class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  List forLooter = [];

  String nameForTextField;
  String imageForTextField;
  List resultForTextField;

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
                          autofocus: true,
                          controller: _controller,
                          onChanged: (_controller) {
                            for (var i in mocks) {
                              if (i.name.contains(_controller) &&
                                      _controller.length > 2 ||
                                  i.name.contains(' ' + _controller) &&
                                      _controller.length > 3 ||
                                  i.name.contains('  ' + _controller) &&
                                      _controller.length > 3) {

                                nameForTextField = i.name;
                                imageForTextField = i.image;
                                resultForTextField = funcForTextField(
                                    //функции все внизу
                                    forLooter,
                                    nameForTextField,
                                    imageForTextField); // в список forLooter собирается [nameForTextField,imageForTextField]
                              }
                            }

                            setState(() {
                              resultForTextField =
                                  resultForTextField; // это чтобы только в forLooter данные прошли
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
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
                                        mocks, forLooter[index][0]))));
                      },
                      child: Container(
                          width: 100,
                          height: 70,
                          child: Stack(children: [
                            Container(
                                child: Row(children: [
                              Text(forLooter[index][0]),
                              SizedBox(
                                width: 50,
                              ),
                              Container(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(forLooter[index][1]))
                            ])),
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
                      'очистить',
                    ))),
          ),
        ],
      )),
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
              label: ' ',
              backgroundColor: Colors.white)
        ],
      ), //tyt
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

List funcForTextField(data, word, image) {//собирает в список название и ссылку на картинку. Это результат поиска
  data.clear();
  data.add([word, image]);
  return data;
}
