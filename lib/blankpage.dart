import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {

  final AssetImage img;

  BlankPage({this.img});


  @override
  Widget build(BuildContext context) {
    return new Center(
      child: img != null ? Image(image: img) : Text('I\'m a blank page'),
    );
  }
}