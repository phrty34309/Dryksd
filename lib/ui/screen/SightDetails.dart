import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/Colors.dart';

class SightDetails extends StatefulWidget {
  final Sight sight;

  SightDetails(this.sight);

  @override
  _SightDetailsState createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Center(
                      child: Container(
                          height: 361,
                          child: Image.network(
                            widget.sight.image,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadProgress) {
                              if (loadProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadProgress.expectedTotalBytes != null
                                      ? loadProgress.cumulativeBytesLoaded /
                                          loadProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ))),
                  Container(
                    width: 360,
                    height: 7.57,
                    color: colorBtnGallery,
                    margin: EdgeInsets.fromLTRB(0.0, 353.43, 0.0, 0.0),
                  ),
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
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0)),
                          color: colorBtnBack,
                        ),
                      ))
                ],
              ),
              height: 361,
              width: 360,
            ),
            Container(
                width: 360,
                height: 400,
                //color: colorBgBottom,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        widget.sight.name,
                        style: TextStyle(
                            fontSize: 24,
                            color: colorText1,
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
                              text: widget.sight.type,
                              style: TextStyle(
                                fontSize: 14,
                                color: colorText1,
                              ),
                              children: <TextSpan>[
                            TextSpan(
                                text: '   открыто круглосуточно',
                                style:
                                    TextStyle(fontSize: 14, color: colorText2))
                          ])),
                    ),
                    Container(
                      width: 328,
                      height: 72,
                      margin: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                      child: Text(
                        widget.sight.details,
                        style: TextStyle(
                            fontSize: 14,
                            color: colorText1,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    InkWell(
                        splashColor: Colors.cyanAccent,
                        onTap: () {
                          setState(() {
                            print('строим маршрут');
                          });
                        },
                        child: Container(
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
                              color: colorBtnRout,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'ПОСТРОИТЬ МАРШРУТ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: colorText3,
                                    decoration: TextDecoration.none),
                              ),
                            ))),
                    Container(
                      width: 360,
                      child: Row(children: [
                        InkWell(
                            splashColor: Colors.cyanAccent,
                            onTap: () {
                              setState(() {
                                print('планируем');
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(16.0, 32.0, 0.0, 0.0),
                              height: 40,
                              width: 164,
                              child: Row(
                                children: [
                                  Container(
                                    width: 22,
                                    height: 19,
                                    color: colorBtnLeft,
                                    margin: EdgeInsets.fromLTRB(
                                        14.0, 10.5, 9.0, 10.5),
                                  ),
                                  Container(
                                    child: Text(
                                      'Запланировать',
                                      style: TextStyle(
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                          color: colorText1),
                                    ),
                                    width: 112,
                                    height: 18,
                                    margin: EdgeInsets.fromLTRB(
                                        0.0, 11.0, 0.0, 11.0),
                                  )
                                ],
                              ),
                            )),
                        InkWell(
                            splashColor: Colors.cyanAccent,
                            onTap: () {
                              setState(() {
                                print('избранное');
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0.0, 32.0, 16.0, 0.0),
                              width: 164,
                              height: 40,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 18,
                                    color: colorBtnRight,
                                    margin: EdgeInsets.fromLTRB(
                                        23.0, 11.0, 0.0, 11.0),
                                  ),
                                  Container(
                                    child: Text(
                                      'В Избранное',
                                      style: TextStyle(
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                          color: colorText1),
                                    ),
                                    height: 18,
                                    margin: EdgeInsets.fromLTRB(
                                        10.0, 11.0, 18.0, 11.0),
                                  )
                                ],
                              ),
                            ))
                      ]),
                    )
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
