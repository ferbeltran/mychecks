import 'package:flutter/material.dart';
import '../models/check.dart';
import 'carditem.dart';

class MyCheck extends StatelessWidget {
  final Check cheque;

  MyCheck({Key key, @required this.cheque}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          new IconButton(
            alignment: Alignment.centerLeft,
            icon: new Icon(Icons.share),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: Stack(children: <Widget>[
        Container(
          height: 100.0,
          width: double.infinity,
          color: Colors.blue,
        ),
        ListView(
        children: <Widget>[
          Hero(
            child: CardItem(check: cheque),
            tag: cheque.titleText,
          ),
        ],
      ),
      ],)
    );
  }
}
