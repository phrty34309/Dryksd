import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/Colors.dart';
import 'dart:math';
import 'package:places/mocks.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_card.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

bool _checkbox_hotel = false; //это для сброса чекбоксов
bool _checkbox_restaraunt = false;
bool _checkbox_special = false;
bool _checkbox_park = false;
bool _checkbox_museum = false;
bool _checkbox_cafe = false;

var colorHotel = Colors.greenAccent; //это для смены цвета при сбросе чекбоксов
var colorRestaraunt = Colors.greenAccent;
var colorSpecial = Colors.greenAccent;
var colorPark = Colors.greenAccent;
var colorMuseum = Colors.greenAccent;
var colorCafe = Colors.greenAccent;

String strValue = '0.000'; // это радиус показывает в метрах
String amount = '0'; // это количество мест показывает в кнопке зеленой внизу
var _value = 100.0;
var centerPoint = [55.7546469, 37.6214679]; // координата центра
var mockses; //список коорднат мест
int amountOfPlaces; //число мест которые поблизости

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: [
      Row(
        children: [
          Container(
            width: 160,
            height: 144,
            child: Column(
              children: [
                Align(
                    alignment: FractionalOffset(0.1, 0.0),
                    child: Container(
                      child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),
                          color: Colors.white,
                          splashColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            setState(
                              () {
                                print('Назад');
                              },
                            );
                          },
                          child: Icon(Icons.reply)),
                      width: 32,
                      height: 32,
                      margin: EdgeInsets.fromLTRB(0.0, 26.0, 0.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0)),
                        color: colorBtnBack,
                      ),
                    )),
                Container(
                  child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        setState(() {
                          print('категории');
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                        child: Text(
                          'КАТЕГОРИИ',
                          style: TextStyle(fontSize: 12),
                        ),
                        width: 72,
                        height: 20,
                      )),
                  width: 172,
                  margin: EdgeInsets.fromLTRB(0.0, 56.0, 0.0, 0.0),
                  height: 30,
                )
              ],
            ),
          ),
          Container(
            child: InkWell(
                // это сброс чекбоксов и цвета
                splashColor: Colors.white,
                onTap: () {
                  setState(() {
                    _checkbox_hotel = false;
                    _checkbox_restaraunt = false;
                    _checkbox_special = false;
                    _checkbox_park = false;
                    _checkbox_museum = false;
                    _checkbox_cafe = false;
                    colorHotel = Colors.greenAccent;
                    colorRestaraunt = Colors.greenAccent;
                    colorSpecial = Colors.greenAccent;
                    colorPark = Colors.greenAccent;
                    colorMuseum = Colors.greenAccent;
                    colorCafe = Colors.greenAccent;
                  });
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(111.0, 26.0, 16.0, 0.0),
                  child: Text(
                    'Очистить',
                    style: TextStyle(fontSize: 16),
                  ),
                  width: 72,
                  height: 20,
                )),
            width: 200,
            height: 144,
          ),
        ],
      ),
      SizedBox(
        height: 24,
        width: 360,
      ),
      Container(
        //Иконки тут три штуки
        child: Row(
          children: [
            Container(
                child: Stack(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(40.5, 0.0, 0.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                          bottomLeft: Radius.circular(35.0),
                          bottomRight: Radius.circular(35.0)),
                      color: colorHotel,
                    ),
                    width: 64,
                    height: 64,
                    child: IconButton(
                      icon: Icon(Icons.hotel),
                      onPressed: () {
                        print('hotel');
                      },
                    )),
                Container(
                  child: Checkbox(
                    activeColor: Colors.transparent,
                    checkColor: Colors.purple,
                    value: _checkbox_hotel,
                    onChanged: (value) {
                      setState(() {
                        if (_checkbox_hotel == true) {
                          _checkbox_hotel = false;
                          colorHotel = Colors.greenAccent;
                        } else {
                          _checkbox_hotel = true;
                          colorHotel = Colors.tealAccent;
                        }
                      });
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(77.5, 40.0, 0.0, 0.0),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0)),
                    color: Colors.tealAccent,
                  ),
                )
              ],
            )),
            Container(
                child: Stack(
              children: [
                Container(
                  child: Icon(Icons.restaurant),
                  margin: EdgeInsets.fromLTRB(44.0, 0.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0)),
                    color: colorRestaraunt,
                  ),
                  width: 64,
                  height: 64,
                ),
                Container(
                  child: Checkbox(
                    activeColor: Colors.transparent,
                    checkColor: Colors.purple,
                    value: _checkbox_restaraunt,
                    onChanged: (value) {
                      setState(() {
                        if (_checkbox_restaraunt == true) {
                          _checkbox_restaraunt = false;
                          colorRestaraunt = Colors.greenAccent;
                        } else {
                          _checkbox_restaraunt = true;
                          colorRestaraunt = Colors.tealAccent;
                        }
                      });
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(80.5, 40.0, 0.0, 0.0),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                          bottomLeft: Radius.circular(35.0),
                          bottomRight: Radius.circular(35.0)),
                      color: Colors.tealAccent),
                )
              ],
            )),
            Container(
                child: Stack(
              children: [
                Container(
                  child: Icon(Icons.star_border),
                  margin: EdgeInsets.fromLTRB(44.0, 0.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                          bottomLeft: Radius.circular(35.0),
                          bottomRight: Radius.circular(35.0)),
                      color: colorSpecial),
                  width: 64,
                  height: 64,
                ),
                Container(
                  child: Checkbox(
                    activeColor: Colors.transparent,
                    checkColor: Colors.purple,
                    value: _checkbox_special,
                    onChanged: (value) {
                      setState(() {
                        if (_checkbox_special == true) {
                          _checkbox_special = false;
                          colorSpecial = Colors.greenAccent;
                        } else {
                          _checkbox_special = true;
                          colorSpecial = Colors.tealAccent;
                        }
                      });
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(80.5, 40.0, 0.0, 0.0),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0)),
                    color: Colors.tealAccent,
                  ),
                )
              ],
            )),
          ],
        ),
        width: 360,
      ),
      Container(
        child: Row(
          children: [
            Container(
              child: Center(
                child: Text(
                  'Отель',
                  style: TextStyle(),
                ),
              ),
              width: 96,
              height: 16,
              margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            ),
            Container(
              child: Center(
                child: Text(
                  'Ресторан',
                  style: TextStyle(),
                ),
              ),
              width: 96,
              height: 16,
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            ),
            Container(
              child: Center(
                child: Text(
                  'Особое место',
                  style: TextStyle(),
                ),
              ),
              width: 96,
              height: 16,
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            )
          ],
        ),
      ),
      SizedBox(
        height: 40,
        width: 360,
      ),
      Container(
        //Иконки тут три штуки
        child: Row(
          children: [
            Container(
                child: Stack(
              children: [
                Container(
                  child: Icon(Icons.park),
                  margin: EdgeInsets.fromLTRB(40.5, 0.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                          bottomLeft: Radius.circular(35.0),
                          bottomRight: Radius.circular(35.0)),
                      color: colorPark),
                  width: 64,
                  height: 64,
                ),
                Container(
                  child: Checkbox(
                    activeColor: Colors.transparent,
                    checkColor: Colors.purple,
                    value: _checkbox_park,
                    onChanged: (value) {
                      setState(() {
                        if (_checkbox_park == true) {
                          _checkbox_park = false;
                          colorPark = Colors.greenAccent;
                        } else {
                          _checkbox_park = true;
                          colorPark = Colors.tealAccent;
                        }
                      });
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(77.5, 40.0, 0.0, 0.0),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0)),
                    color: Colors.tealAccent,
                  ),
                )
              ],
            )),
            Container(
                child: Stack(
              children: [
                Container(
                  child: Icon(Icons.museum),
                  margin: EdgeInsets.fromLTRB(44.0, 0.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0)),
                    color: colorMuseum,
                  ),
                  width: 64,
                  height: 64,
                ),
                Container(
                  child: Checkbox(
                    activeColor: Colors.transparent,
                    checkColor: Colors.purple,
                    value: _checkbox_museum,
                    onChanged: (value) {
                      setState(() {
                        if (_checkbox_museum == true) {
                          _checkbox_museum = false;
                          colorMuseum = Colors.greenAccent;
                        } else {
                          _checkbox_museum = true;
                          colorMuseum = Colors.tealAccent;
                        }
                      });
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(80.5, 40.0, 0.0, 0.0),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                          bottomLeft: Radius.circular(35.0),
                          bottomRight: Radius.circular(35.0)),
                      color: Colors.tealAccent),
                )
              ],
            )),
            Container(
                child: Stack(
              children: [
                Container(
                  child: Icon(Icons.local_cafe),
                  margin: EdgeInsets.fromLTRB(44.0, 0.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0)),
                    color: colorCafe,
                  ),
                  width: 64,
                  height: 64,
                ),
                Container(
                  child: Checkbox(
                    activeColor: Colors.transparent,
                    checkColor: Colors.purple,
                    value: _checkbox_cafe,
                    onChanged: (value) {
                      setState(() {
                        if (_checkbox_cafe == true) {
                          _checkbox_cafe = false;
                          colorCafe = Colors.greenAccent;
                        } else {
                          _checkbox_cafe = true;
                          colorCafe = Colors.tealAccent;
                        }
                      });
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(80.5, 40.0, 0.0, 0.0),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                        bottomLeft: Radius.circular(35.0),
                        bottomRight: Radius.circular(35.0)),
                    color: Colors.tealAccent,
                  ),
                )
              ],
            )),
          ],
        ),
        width: 360,
      ),
      Container(
        child: Row(
          children: [
            Container(
              child: Center(
                child: Text(
                  'Парк',
                  style: TextStyle(),
                ),
              ),
              width: 96,
              height: 16,
              margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
            ),
            Container(
              child: Center(
                child: Text(
                  'Музей',
                  style: TextStyle(),
                ),
              ),
              width: 96,
              height: 16,
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            ),
            Container(
              child: Center(
                child: Text(
                  'Кафе',
                  style: TextStyle(),
                ),
              ),
              width: 96,
              height: 16,
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            )
          ],
        ),
      ),
      SizedBox(
        height: 56,
        width: 360,
      ),
      Container(
        width: 360,
        child: Container(
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(16.0, 4.0, 0.0, 0.0),
                  width: 88,
                  height: 20,
                  child: Text('Расстояние')),
              SizedBox(
                width: 132,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 4.0, 16.0, 0.0),
                width: 108,
                height: 20,
                child: Text(strValue.substring(0, 5) +
                    ' метров'), //тут показывает сколько метров радиус охвата
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 31,
      ),
      Container(
          child: Slider(
              value: _value,
              min: 100.0,
              max: 10000.0,
              label: '$_value',
              onChanged: (value) {
                setState(() {
                  _value = value;
                  strValue = _value.toString();
                  mockses = [
                    mocks[0].geoPosition,
                    mocks[1].geoPosition,
                    mocks[2].geoPosition
                  ];
                  List x = (globfinder(mockses, centerPoint, _value));
                  amountOfPlaces = x.length;
                  amount = amountOfPlaces
                      .toString(); //количество мест которые в радиусе
                });
              })),
      SizedBox(
        height: 20,
      ),
      Container(
          width: 328,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0)),
            color: Colors.greenAccent,
          ),
          child: InkWell(
            splashColor: Colors.white,
            onTap: () {
              setState(() {
                print('это места');
              });
            },
            child: Center(
                child: Row(children: [
              SizedBox(
                width: 135,
              ),
              Text('Мест('),
              Text(amount),
              Text(')')
            ])),
          )),
    ]))));
  }
}

bool finder(centerPoint, checkPoint, km) {
  //формула Пифагора про гипотенузу и катеты. Используется ниже в globalfinder.
  double ky = 40000 / 360;
  double kx = cos(pi * centerPoint[0] / 180) * ky;
  double dx = (centerPoint[1] - checkPoint[1]).abs() * kx;
  double dy = (centerPoint[0] - checkPoint[0]).abs() * ky;
  return (sqrt(dx * dx + dy * dy) <= km);
}

List globfinder(listOfGeoOfPlaces, meinPlace, radius) {
  //выдает список bool, который содержит только true. Используется выше в Slider.
  List sp = [];
  for (var i in listOfGeoOfPlaces) {
    bool m = finder(i, meinPlace, radius);
    if (m == true) {
      sp.add(m);
    }
  }
  return sp;
}
