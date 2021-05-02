import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class sightDetails extends StatelessWidget {
  final Sight sight;

  sightDetails(this.sight);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Align(
                    alignment: FractionalOffset(0.1, 0.0),
                    child: Container(
                      width: 32,
                      height: 32,
                      margin: EdgeInsets.fromLTRB(0.0, 26.0, 0.0, 0.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)),
                        color: Colors.white,
                      ),
                    )),
                Container(
                  width: 360,
                  height: 7.57,
                  color: Colors.purple,
                  margin: EdgeInsets.fromLTRB(0.0, 295, 0.0, 0.0),
                )
              ], //кнопка назад и кнопка прокрутки галереи
            ),
            height: 361,
            width: 360,
            color: Colors.tealAccent,
          ),
          Container(
              width: 360,
              height: 400,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      sight.name,
                      style: TextStyle(
                          fontSize: 24,
                          color: const Color(0xFF3B3E5B),
                          decoration: TextDecoration.none),
                    ),
                    height: 29,
                    width: 328,
                    margin: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                  ),
                  Container(
                    width: 328,
                    height: 18,
                    margin: EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 0.0),
                    child: RichText(
                        text: TextSpan(
                            text: sight.type,
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color(0xFF3B3E5B),
                            ),
                            children: <TextSpan>[
                          TextSpan(
                              text: '   открыто круглосуточно',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF7C7E91)))
                        ])),
                  ),
                  Container(
                    width: 328,
                    height: 72,
                    margin: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                    child: Text(
                      sight.details,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF3B3E5B),
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Container(
                      width: 328,
                      height: 48,
                      margin: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                      //color: Colors.green,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0)),
                        color: Colors.green,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'ПОСТРОИТЬ МАРШРУТ',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                          //textAlign: TextAlign.center,
                        ),
                      )),
                  Container(
                    width: 360,
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 32.0, 0.0, 0.0),
                        height: 40,
                        width: 164,
                        //color: Colors.amber,
                        child: Row(
                          children: [
                            Container(
                              width: 22,
                              height: 19,
                              color: Colors.blueAccent,
                              margin:
                                  EdgeInsets.fromLTRB(14.0, 10.5, 9.0, 10.5),
                            ),
                            Container(
                              child: Text(
                                'Запланировать',
                                style: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    color: Color.fromRGBO(124, 126, 146, 0.56)),
                              ),
                              width: 112,
                              height: 18,
                              //color: Colors.deepOrangeAccent,
                              margin: EdgeInsets.fromLTRB(0.0, 11.0, 0.0, 11.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 32.0, 16.0, 0.0),
                        width: 164,
                        height: 40,
                        //color: Colors.cyan,
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 18,
                              color: Colors.yellow,
                              margin:
                                  EdgeInsets.fromLTRB(23.0, 11.0, 0.0, 11.0),
                            ),
                            Container(
                              child: Text(
                                'В Избранное',
                                style: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    color: Color(0xFF3B3E5B)),
                              ),
                              //width: 84,
                              height: 18,
                              //color: Colors.deepOrange,
                              margin:
                                  EdgeInsets.fromLTRB(10.0, 11.0, 18.0, 11.0),
                            )
                          ],
                        ),
                      )
                    ]),
                  )
                ],
              )),
        ],
      ),
    ));
  }
}
