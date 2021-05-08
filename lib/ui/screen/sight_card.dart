import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

//класс SightCard карточка места для показа ее в sight_list_screen.dart

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 3 / 2,
        child: Column(children: <Widget>[
          Container(
              child: Stack(children: <Widget>[
                Container(
                  child: Text(
                    (sight.type),
                    style: TextStyle(
                        fontSize: 14.0, color: const Color(0xFF3B3E5B)),
                  ),
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                ),
                Positioned(
                  left: 143,
                  top: 35,
                  child: Container(
                    child: CircularProgressIndicator( //прогресс индикатор
                      value: 0.9,
                    ),
                  ),
                )
              ]),
              height: 96,
              width: 328,
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)),
                  image: DecorationImage( // картинка тут
                      image: AssetImage(sight.image), fit: BoxFit.cover))),
          SizedBox(
            width: 328,
            height: 10,
          ),
          Column(children: <Widget>[
            Container(
              child: Text(
                (sight.name),
                style:
                    TextStyle(fontSize: 16.0, color: const Color(0xFF3B3E5B)),
              ),
              margin: EdgeInsets.fromLTRB(32.0, 16.0, 16.0, 0.0),
              height: 26,
              width: 328,
            ),
            Container(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: 370,
                      minHeight: 70,
                      maxWidth: 374,
                      maxHeight: 150),
                  child: Text(
                    'краткое описание...',
                    style: TextStyle(fontSize: 14.0, color: Color(0xFF7C7E91)),
                  )),
              margin: EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0),
              height: 70,
              //width: 328,
            )
          ])
        ]));
  }
}
