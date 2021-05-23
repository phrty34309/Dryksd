
import 'package:flutter/material.dart';

//import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

class Visiting extends StatefulWidget {
  final List? nameWantVisitPlace;
  final List? nameHaveVisitedPlaces;

  const Visiting(
      {Key? key, this.nameWantVisitPlace, this.nameHaveVisitedPlaces})
      : super(key: key); // из Sight_Card

  @override
  _VisitingState createState() => _VisitingState();
}

class _VisitingState extends State<Visiting> {
  final List wantPlaces = wantVisitPlaces;
  final List havePlaces = haveVisitedPlaces;

  final List emptyPage = [Empty()]; //если все удалят и список = 0.

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 36,
          bottom: PreferredSize(
            preferredSize: Size(100.0, 200.0),
            child: Container(
              margin: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 30.0),
              width: 328,
              height: 40,
              child: TabBar(
                  unselectedLabelColor: Colors.redAccent,
                  indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                  indicator: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.orangeAccent]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blueAccent,
                  ), //redAccent),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Хочу посетить"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Посетил"),
                      ),
                    )
                  ]),
            ),
          ),
          title: Container(
            margin: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 30.0),
            width: 360,
            height: 36,
            child: Center(
              child: Container(
                child: Row(
                  children: [
                    Page1(key_1),//глобальный ключ из sight_card
                    Container(
                      child: Text(
                        "Избранное",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xFF3B3E5B),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          ListView.builder(
              //тут список непосещенных мест из SightCard
              padding: const EdgeInsets.all(4),
              itemCount: wantPlaces.length,
              itemBuilder: (BuildContext context, int index) {
                return wantPlaces.length > 0
                    ? SightCard(wantPlaces[index])
                    : emptyPage[0];
              }),
          ListView.builder(
              //тут список посещенных мест из SightCard
              padding: const EdgeInsets.all(4),
              itemCount: havePlaces.length,
              itemBuilder: (BuildContext context, int index) {
                return havePlaces.length > 0
                    ? SightCard(havePlaces[index])
                    : emptyPage[0];
              }),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //чтобы первая иконка не выезжала
          items: [
            BottomNavigationBarItem(
                icon: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    print('да, это меню');
                  },
                  child: Container(
                    width: 70,
                    child: Icon(
                      Icons.format_list_bulleted,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    print('да, это карта');
                  },
                  child: Container(
                    width: 70,
                    child: Icon(
                      Icons.map,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                label: '',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    print('да, это like');
                  },
                  child: Container(
                    width: 70,
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
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
                  ),
                ),
                label: '',
                backgroundColor: Colors.white)
          ],
        ),
      ),
    );
  }
}

class Empty extends StatefulWidget {
  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Empty',
          style: TextStyle(
              color: const Color(0xFF3B3E5B),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
