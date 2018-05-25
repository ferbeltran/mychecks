import 'package:flutter/material.dart';
import 'listpage.dart';
import 'blankpage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My checks',
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: new TabsPage(),
    );
  }
}

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => new _TabsPageState();
}

class _TabsPageState extends State<TabsPage>
    with SingleTickerProviderStateMixin {
 
  TabController tabController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.info),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              showAboutDialog(context: context, applicationIcon: Icon(Icons.insert_chart), applicationLegalese: 'Muajaja');
            },
          ),
          new IconButton(
            icon: new Icon(Icons.add_box),
            color: Colors.blue,
            onPressed: () {},
          ),
        ],
        title: Text(
          'My checks',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: TabBarView(
        children: <Widget>[
          ListPage(scaffoldKey: scaffoldKey),
          BlankPage(),
          BlankPage(),
          BlankPage(),
          BlankPage(img: AssetImage('img/meme.jpg')),
        ],
        controller: tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black26,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.dashboard),
            ),
            Tab(
              icon: Icon(Icons.adjust),
            ),
            Tab(
              icon: Icon(Icons.cloud),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
