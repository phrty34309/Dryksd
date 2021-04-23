import 'package:flutter/material.dart';


class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        toolbarHeight: 120, //  высоту
        elevation: 0.0, //убрал тень
        title: RichText(
          text: TextSpan(text: 'С', style: TextStyle(color: Colors.amber),
              children: [TextSpan(text: 'писок \n', style: TextStyle(color: Colors.black),
            children:[TextSpan(text: 'И', style: TextStyle(color: Colors.yellowAccent),
            children: [TextSpan(text: 'нтересных', style: TextStyle(color: Colors.black),
                children:[TextSpan(text: ' мест', style: TextStyle(color: Colors.black),
                )
                ]
            )
            ]
            )
            ]
              )
              ]

        )
      ),
       backgroundColor: Colors.white,
    )
    );
  }
}
