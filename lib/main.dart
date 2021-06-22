import 'package:devbybit/labs/FlutterPDF.dart';
import 'package:flutter/material.dart';

import 'labs/CustomDialog.dart';
import 'labs/GooglePolylines.dart';
import 'labs/RowCheatSheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevByBit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'DevByBit Labs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> _homeMenu() {
    List<dynamic> menu = new List();

    menu.add({
      "title": "Custom Dialog",
      "desc": "Flutter creating a custom dialog",
      "route": CustomDialog()
    });
    menu.add({
      "title": "Flutter PDF",
      "desc": "Generating PDFs in flutter",
      "route": FlutterPdf()
    });
    menu.add({
      "title": "Row Cheat Sheet",
      "desc": "Flutter Row Cheat sheet",
      "route": RowCheatSheet()
    });

    menu.add({
      "title": "Google polylines",
      "desc": "Add polylines in Google maps between two locations",
      "route": GooglePolylines()
    });


    return menu;
  }

  @override
  Widget build(BuildContext context) {
    Widget menuItem(dynamic item) {
      return InkWell(
        onTap: () {
          Route route = MaterialPageRoute(builder: (context) => item['route']);
          Navigator.push(context, route);
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['title'],
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                item['desc'],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              Divider()
            ],
          ),
        ),
      );
    }

    Widget body() {
      return CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) {
                return menuItem(_homeMenu()[i]);
              },
              childCount: _homeMenu().length,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: body(),
    );
  }
}
