import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/Category.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/SightSearchScreen.dart';
import 'package:places/mocks.dart';

//import 'package:places/ui/screen/sight_card.dart';
//import 'package:places/domain/sight.dart';
//import 'package:places/ui/screen/VisitingScreen.dart';

class AddSight extends StatefulWidget {
  final String? namecategory;

  const AddSight({Key? key, this.namecategory})
      : super(key: key); // из Category

  @override
  _AddSightState createState() => _AddSightState();
}

List? dataFromAddSightScreen;

class _AddSightState extends State<AddSight> {
//String category;
  late String name;
  late String shirota;
  late String dolgota;
  late String about;
  late bool favorite;
  late bool wantVisited;
  late bool haveVisited;

  final _catcontroller = TextEditingController(text: category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 56,
              width: 360,
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text('Отмена',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  Container(
                    child: Text('Новое место',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
            Container(
                child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                width: 320,
                child: TextField(
                  key: Key(category),
                  controller: _catcontroller,
                  style: TextStyle(fontSize: 12, color: Colors.green),
                  decoration: InputDecoration(
                      labelText: 'категория',
                      hintText: 'Не выбрано',
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  textInputAction: TextInputAction.next,
                ),
              ),
              Container(
                  child: InkWell(
                      splashColor: Colors.blueAccent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Category()));
                      },
                      child: Icon(Icons.arrow_forward)))
            ])),
            Container(
              width: 328,
              height: 68,
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: TextField(
                onChanged: (text) {
                  name = text;
                },
                textInputAction: TextInputAction.next,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'название',
                  hintText: 'введите текст',
                ),
              ),
            ),
            Container(
              height: 68,
              child: Row(
                children: [
                  Container(
                    width: 160,
                    margin: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 0.0),
                    child: TextField(
                      onChanged: (text) {
                        shirota = text;
                      },
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'широта',
                        hintText: 'введите текст',
                      ),
                    ),
                  ),
                  Container(
                    width: 156,
                    margin: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 0.0),
                    child: TextField(
                      onChanged: (text) {
                        dolgota = text;
                      },
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'долгота',
                        hintText: 'введите текст',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                splashColor: Colors.blueAccent,
                onTap: () {
                  setState(() {
                    print('категории'); //пока тут принт далее будет другое
                  });
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    width: 160,
                    height: 20,
                    child: Text('Указать на карте'),
                  ),
                )),
            Container(
              width: 328,
              child: TextField(
                onChanged: (text) {
                  about = text;
                },
                maxLines: 3,
                style: TextStyle(fontSize: 12, color: Colors.green),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'описание',
                  hintText: 'введите текст',
                ),
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => FocusScope.of(context).unfocus,
              ),
            ),
            InkWell(
              splashColor: Colors.blueAccent,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SightSearchScreen()));

                setState(() {
                  dataFromAddSightScreen = [
                    category,
                    name,
                    [shirota, dolgota],
                    about
                  ];

                  mocks.add(Sight(
                      name,
                      [shirota, dolgota],
                      'https://',
                      about,
                      category,
                      image =
                          'https://fs.tonkosti.ru/89/3w/893w7b7qx0wskksw0kk0k0408.jpg',
                      favorite,
                      wantVisited,
                      haveVisited));

                  print(dataFromAddSightScreen);
                  print(mocks);
                });
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0.0, 110.0, 0.0, 0.0),
                child: Text('СОЗДАТЬ'),
              ),
            )
          ],
        ),
      )),
    );
  }
}
