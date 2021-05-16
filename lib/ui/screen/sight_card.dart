import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

//класс SightCard карточка места для показа ее в sight_list_screen.dart

class SightCard extends StatefulWidget {
  final Sight sight;

  SightCard(this.sight);

  @override
  _SightCardState createState() => _SightCardState();
}

class _SightCardState extends State<SightCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 3 / 2,
        child: Column(children: <Widget>[
          Container(
            child: InkWell(
                splashColor: Colors.cyanAccent,
                onTap: () {
                  setState(() {
                    print('да, это кремль');
                  });
                },
                child: Container(
                    child: Stack(children: <Widget>[
                  Container(
                    height: 96,
                    width: 328,
                    margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
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
                        )),
                  ),
                  Container(
                    child: Text(
                      (widget.sight.type),
                      style: TextStyle(
                          fontSize: 14.0, color: const Color(0xFF3B3E5B)),
                    ),
                    margin: EdgeInsets.fromLTRB(23.0, 18.0, 0.0, 0.0),
                  ),
                ]))),
          ),
          SizedBox(
            width: 328,
            height: 10,
          ),
          Column(children: <Widget>[
            Container(
              child: Text(
                (widget.sight.name),
                style:
                    TextStyle(fontSize: 16.0, color: const Color(0xFF3B3E5B)),
              ),
              margin: EdgeInsets.fromLTRB(32.0, 16.0, 16.0, 0.0),
              height: 26,
              width: 328,
            ),
            InkWell(
                splashColor: Colors.cyanAccent,
                onTap: () {
                  setState(() {
                    print('да, это краткое описание');
                  });
                },
                child: Container(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: 370,
                          minHeight: 70,
                          maxWidth: 374,
                          maxHeight: 150),
                      child: Text(
                        'краткое описание...',
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xFF3B3E5B)),
                      )),
                  margin: EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0),
                  height: 70,
                  //width: 328,
                ))
          ])
        ]));
  }
}
