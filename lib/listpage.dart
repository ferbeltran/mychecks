import 'dart:async';
import 'package:flutter/material.dart';
import 'data/checksdata.dart';
import 'widgets/carditem.dart';
import 'widgets/checkdetail.dart';
import 'models/check.dart';
import 'blankpage.dart';

class ListPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  ListPage({this.scaffoldKey});

  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Check> _checks = new List<Check>();

  @override
  void initState() {
    super.initState();
    _checks.addAll(checks);
  }

  Future<Null> refreshList() async {
    setState(() {
      checks.forEach((c) {
        if (!_checks.contains(c)) {
          _checks.add(c);
        }
      });

      widget.scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        backgroundColor: Colors.green,
        content: Text("AH PERRO TRAES EL OMNITRIX"),
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      onRefresh: refreshList,
      child: new ListView.builder(
        // padding: new EdgeInsets.all(8.0),
        itemCount: _checks.length,
        itemBuilder: (context, int index) {
          return Dismissible(
            background: Material(
              color: Colors.redAccent,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Icon(
                      Icons.delete,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            secondaryBackground: Material(
              color: Colors.blue,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Icon(
                      Icons.thumb_up,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            key: Key(_checks[index].titleText),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  _checks.removeAt(index);
                });
                widget.scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.blue,
                    content: Text("Tu puta madre"),
                  ),
                );
              } else {
                setState(() {
                  _checks.removeAt(index);
                });
                widget.scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.redAccent,
                    content: Text("Me borraste culero, alv :v"),
                  ),
                );
              }
            },
            child: new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new MyCheck(cheque: _checks[index]),
                  ),
                );
              },
              child: new Hero(
                tag: _checks[index].titleText,
                child: CardItem(check: _checks[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
