import 'package:flutter/material.dart';
import 'widgets/carditem.dart';
import 'models/check.dart';


class ListPage extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  ListPage({this.scaffoldKey});

  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> {

    var _checks = <Check>[
     Check(
      headerIcon: Icons.signal_cellular_4_bar,
      titleText: 'Wilson Produce',
      cornerIcon: Icons.spa,
      amount: '\$13,897.00',
      date: '23.05.2018',
      status: 'Completed',
      headerIconColor: Colors.deepOrange,
      headerIconTextColor: Colors.white,
      cornerIconColor: Colors.black26,
    ),
    Check(
      headerIcon: Icons.wb_sunny,
      titleText: 'Sunfed',
      cornerIcon: Icons.brightness_1,
      amount: '\$3,857.00',
      date: '22.05.2018',
      status: 'Pending',
      headerIconColor: Colors.black,
      headerIconTextColor: Colors.yellow,
      cornerIconColor: Colors.blue,
    ),
    Check(
      headerIcon: Icons.brightness_2,
      titleText: 'Trufresh',
      cornerIcon: Icons.timelapse,
      amount: '\$13,897.00',
      date: '23.05.2018',
      status: 'Completed',
      headerIconColor: Colors.redAccent,
      headerIconTextColor: Colors.black,
      cornerIconColor: Colors.green,
    ),
    Check(
      headerIcon: Icons.view_week,
      titleText: 'Papayas & More',
      cornerIcon: Icons.arrow_drop_down_circle,
      amount: '\$8,835.00',
      date: '23.05.2018',
      status: 'Completed',
      headerIconColor: Colors.white30,
      headerIconTextColor: Colors.black,
      cornerIconColor: Colors.blue,
    ),
    Check(
      headerIcon: Icons.adb,
      titleText: 'Ruby J. Farms',
      cornerIcon: Icons.blur_on,
      amount: '\$10,565.00',
      date: '22.05.2018',
      status: 'Pending',
      headerIconColor: Colors.blue,
      headerIconTextColor: Colors.white,
      cornerIconColor: Colors.redAccent,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      itemCount: _checks.length,
      itemBuilder: (context, int index) {
        return Dismissible(
            background: Material(
              color: Colors.redAccent,
              child: Icon(
                Icons.delete,
                size: 40.0,
                color: Colors.white,
              ),
            ),
            key: Key(_checks[index].titleText),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                _checks.removeAt(index);
                widget.scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.blue,
                        content: Text("Me borraste culero, alv :v"),
                      ),
                    );
              } else { null; }
            },

            child: CardItem(check: _checks[index]));
      },
    );
  }
}




