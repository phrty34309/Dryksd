import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/VisitingScreen.dart';

//класс SightCard карточка места для показа ее в sight_list_screen.dart

//Там в самом низу виджет Page1(), он несет в себе иконку звезды в VisitingScreen. Все это сделано с глобальным ключем
final key_1 = GlobalKey();

class SightCard extends StatefulWidget {
  final Sight? sight;

  SightCard(this.sight);

  @override
  _SightCardState createState() => _SightCardState();
}

//эти функции внизу находятся
List wantVisitPlaces = wantVisitPlace();
List haveVisitedPlaces = haveVisitedPlace();

class _SightCardState extends State<SightCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Column(
        children: <Widget>[
          Container(
            child: InkWell(
              splashColor: Colors.cyanAccent,
              onTap: () {
                print('да, это кремль');
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 96,
                      width: 328,
                      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        child: /*FadeInImage.assetNetwork(
                            placeholder: 'assets/image/loading.gif',
                            image: widget.sight!.image, fit: BoxFit.cover,)*/
                            Image.network(
                          widget.sight!.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        (widget.sight!.type),
                        style: TextStyle(
                            fontSize: 14.0, color: const Color(0xFF3B3E5B)),
                      ),
                      margin: EdgeInsets.fromLTRB(23.0, 18.0, 0.0, 0.0),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(285.0, 5.0, 5.0, 0.0),
                      child: IconButton(
                        //удаляет места из посещенных и непосещенных
                        onPressed: () {
                          if (widget.sight!.wantVisited == true) {
                            //тут список мест которые надо посетить, потом этот список отправляется в VisitingScreen
                            wantVisitPlaces.remove(widget.sight);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Visiting(
                                    nameWantVisitPlace: wantVisitPlaces),
                              ),
                            );
                          }

                          if (widget.sight!.haveVisited == true) {
                            //тут список мест которые посетили, потом этот список отправляется в VisitingScreen
                            haveVisitedPlaces.remove(widget.sight);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Visiting(
                                    nameHaveVisitedPlaces: haveVisitedPlaces),
                              ),
                            );
                          }
                          ;
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 328,
            height: 10,
          ),
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  (widget.sight!.name),
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
                  print('да, это краткое описание');
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
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// функции wantVisitPlaces и haveVisitedPlaces формируют списки посещенных мест и непосещенных мест(в самом начале)

List wantVisitPlace() {
  //непосещенные места
  List result = [];
  for (var i in mocks) {
    if (i.wantVisited == true) {
      result.add(i);
    }
  }
  return result;
}

List haveVisitedPlace() {
  //посещенные места
  List result = [];
  for (var i in mocks) {
    if (i.haveVisited == true) {
      result.add(i);
    }
  }
  return result;
}

class Page1 extends StatefulWidget {
  const Page1(GlobalKey key) : super(key: key);//эксперимент с глобальным ключем

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    // в VisitingScreen
    return Container(
      //key: key_1,//ошибка
      child: Icon(
        Icons.star,
        size: 30,
        color: Colors.orange,
      ),
    );
  }
}
