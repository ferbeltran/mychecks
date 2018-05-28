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
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          // The containers in the background
          new Column(
          
            children: <Widget>[
              new Container(
                height: 150.0,
                color: Colors.blue,
              ),
            ],
          ),
           new Column(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               new Hero(
                  tag: cheque.titleText,
                  child: CardItem(check: cheque),
                ),
             ],
           ), 
        ],
      ),
    );
  }
}
