import 'package:flutter/material.dart';
import 'package:places/ui/screen/Colors.dart';
import 'package:places/ui/screen/AddSightScreen.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

bool _checkbox_kino = false;
bool _checkbox_restoran = false;
bool _checkbox_special = false;
bool _checkbox_teatr = false;
bool _checkbox_museum = false;
bool _checkbox_cafe = false;

var galKino;
var galRestoran;
var galSpecial;
var galTeatr;
var galMuseum;
var galCafe;

List gals = [
  [[galKino], ['кино']],
  [[galRestoran], ['ресторан']],
  [[galSpecial], ['специальное место']],
  [[galTeatr], ['театр']],
  [[galMuseum], ['музей']],
  [[galCafe], ['кафе']],
];

var category;

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: [
                    Container(
                      child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),
                          color: Colors.white,
                          splashColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            setState(
                                  () {
                                Navigator.pop(context);
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
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)),
                        color: colorBtnBack,
                      ),
                    ),
                    Container(
                      child: Text('Категория'),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 300,
                        margin: EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
                        child: Row(children: [
                          Text('Кинотеатр'),
                          SizedBox(
                            width: 200,
                          ),
                          Container(
                            child: galKino,
                          )
                        ]),
                      ),
                      splashColor: Colors.cyanAccent,
                      onTap: () {
                        setState(() {
                          if (_checkbox_kino == true) {
                            _checkbox_kino = false;
                            galKino = null;
                          } else {
                            _checkbox_kino = true;
                            _checkbox_restoran = false;
                            _checkbox_special = false;
                            _checkbox_teatr = false;
                            _checkbox_museum = false;
                            _checkbox_cafe = false;

                            gals[1][0][0] = galRestoran = null;
                            gals[2][0][0] = galSpecial = null;
                            gals[3][0][0] = galTeatr = null;
                            gals[4][0][0] = galMuseum = null;
                            gals[5][0][0] = galCafe = null;
                            gals[0][0][0] = galKino =
                                Icon(Icons.assignment_turned_in_outlined);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        width: 300,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
                        child: Row(children: [
                          Text('Ресторан'),
                          SizedBox(
                            width: 207,
                          ),
                          Container(
                            child: galRestoran,
                          )
                        ]),
                      ),
                      splashColor: Colors.cyanAccent,
                      onTap: () {
                        setState(() {
                          if (_checkbox_restoran == true) {
                            _checkbox_restoran = false;
                            galRestoran = null;
                          } else {
                            _checkbox_restoran = true;
                            _checkbox_kino = false;
                            _checkbox_special = false;
                            _checkbox_teatr = false;
                            _checkbox_museum = false;
                            _checkbox_cafe = false;

                            galSpecial = null;
                            galTeatr = null;
                            galMuseum = null;
                            galCafe = null;
                            galKino = null;
                            galRestoran =
                                Icon(Icons.assignment_turned_in_outlined);

                            gals[1][0][0] = galRestoran =
                                Icon(Icons.assignment_turned_in_outlined);
                            gals[2][0][0] = galSpecial = null;
                            gals[3][0][0] = galTeatr = null;
                            gals[4][0][0] = galMuseum = null;
                            gals[5][0][0] = galCafe = null;
                            gals[0][0][0] = galKino = null;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        width: 300,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
                        child: Row(children: [
                          Text('Особое место'),
                          SizedBox(
                            width: 178,
                          ),
                          Container(
                            child: galSpecial,
                          )
                        ]),
                      ),
                      splashColor: Colors.cyanAccent,
                      onTap: () {
                        setState(() {
                          if (_checkbox_special == true) {
                            _checkbox_special = false;
                            galSpecial = null;
                          } else {
                            _checkbox_special = true;
                            _checkbox_restoran = false;
                            _checkbox_kino = false;
                            _checkbox_teatr = false;
                            _checkbox_museum = false;
                            _checkbox_cafe = false;

                            galTeatr = null;
                            galMuseum = null;
                            galCafe = null;
                            galKino = null;
                            galRestoran = null;
                            galSpecial =
                                Icon(Icons.assignment_turned_in_outlined);

                            gals[1][0][0] = galRestoran = null;
                            gals[2][0][0] = galSpecial =
                                Icon(Icons.assignment_turned_in_outlined);
                            gals[3][0][0] = galTeatr = null;
                            gals[4][0][0] = galMuseum = null;
                            gals[5][0][0] = galCafe = null;
                            gals[0][0][0] = galKino = null;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        width: 300,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
                        child: Row(children: [
                          Text('Театр'),
                          SizedBox(
                            width: 233,
                          ),
                          Container(
                            child: galTeatr,
                          )
                        ]),
                      ),
                      splashColor: Colors.cyanAccent,
                      onTap: () {
                        setState(() {
                          if (_checkbox_teatr == true) {
                            _checkbox_teatr = false;
                            galTeatr = null;
                          } else {
                            _checkbox_teatr = true;
                            _checkbox_special = false;
                            _checkbox_restoran = false;
                            _checkbox_kino = false;
                            _checkbox_museum = false;
                            _checkbox_cafe = false;

                            galMuseum = null;
                            galCafe = null;
                            galKino = null;
                            galRestoran = null;
                            galSpecial = null;
                            galTeatr =
                                Icon(Icons.assignment_turned_in_outlined);

                            gals[1][0][0] = galRestoran = null;
                            gals[2][0][0] = galSpecial = null;
                            gals[3][0][0] = galTeatr =
                                Icon(Icons.assignment_turned_in_outlined);
                            gals[4][0][0] = galMuseum = null;
                            gals[5][0][0] = galCafe = null;
                            gals[0][0][0] = galKino = null;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        width: 300,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
                        child: Row(children: [
                          Text('Музей'),
                          SizedBox(
                            width: 230,
                          ),
                          Container(
                            child: galMuseum,
                          )
                        ]),
                      ),
                      splashColor: Colors.cyanAccent,
                      onTap: () {
                        setState(() {
                          if (_checkbox_museum == true) {
                            _checkbox_museum = false;
                            galMuseum = null;
                          } else {
                            _checkbox_museum = true;
                            _checkbox_teatr = false;
                            _checkbox_special = false;
                            _checkbox_restoran = false;
                            _checkbox_kino = false;
                            _checkbox_cafe = false;

                            galCafe = null;
                            galKino = null;
                            galRestoran = null;
                            galSpecial = null;
                            galTeatr = null;
                            galMuseum =
                                Icon(Icons.assignment_turned_in_outlined);

                            gals[1][0][0] = galRestoran = null;
                            gals[2][0][0] = galSpecial = null;
                            gals[3][0][0] = galTeatr = null;
                            gals[4][0][0] = galMuseum =
                                Icon(Icons.assignment_turned_in_outlined);
                            gals[5][0][0] = galCafe = null;
                            gals[0][0][0] = galKino = null;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        width: 300,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
                        child: Row(children: [
                          Text('Кафе'),
                          SizedBox(
                            width: 235,
                          ),
                          Container(
                            child: galCafe,
                          )
                        ]),
                      ),
                      splashColor: Colors.cyanAccent,
                      onTap: () {
                        setState(() {
                          if (_checkbox_cafe == true) {
                            _checkbox_cafe = false;
                            galCafe = null;
                          } else {
                            _checkbox_cafe = true;
                            _checkbox_museum = false;
                            _checkbox_teatr = false;
                            _checkbox_special = false;
                            _checkbox_restoran = false;
                            _checkbox_kino = false;

                            galKino = null;
                            galRestoran = null;
                            galSpecial = null;
                            galTeatr = null;
                            galMuseum = null;
                            galCafe = Icon(Icons.assignment_turned_in_outlined);

                            gals[1][0][0] = galRestoran = null;
                            gals[2][0][0] = galSpecial = null;
                            gals[3][0][0] = galTeatr = null;
                            gals[4][0][0] = galMuseum = null;
                            gals[5][0][0] = galCafe =
                                Icon(Icons.assignment_turned_in_outlined);
                            gals[0][0][0] = galKino = null;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              InkWell(
                  splashColor: Colors.blueAccent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => AddSight()));

                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AddSight(namecategory: category)));

                        setState(()
                    {
                      for (var i in gals) {
                        if (i[0][0] is Icon) {
                          category = i[1][0];
                          print(category);
                        }
                      }
                    });
                  },
                  child: Container(
                    color: Colors.greenAccent,
                    width: 150,
                    height: 35,
                    child: Center(
                      child: Text('Сохранить'),
                    ),
                  ))
            ],
          )),
    );
  }
}
