import 'package:flutter/material.dart';
import '../models/check.dart';

class CardItem extends StatelessWidget {
 
  final Check check;

  CardItem({this.check});

  @override
  Widget build(BuildContext build) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Material(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        elevation: 8.0,
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: check.headerIconColor,
                    foregroundColor: check.headerIconTextColor,
                    child: Icon(check.headerIcon),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      check.titleText,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    check.cornerIcon,
                    color: check.cornerIconColor,
                  ),
                ],
              ),
            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 18.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Amount',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                      Text(
                        check.amount,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Date',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                      Text(
                        check.date,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Status',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                      Text(
                        check.status,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
