import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowCheatSheet extends StatefulWidget {
  RowCheatSheet({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyState createState() => MyState();
}

class MyState extends State<RowCheatSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget makeBody() {
      return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [Text("Text 1"), Text("Text 2"), Text("Text 3")],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text("Text 1"), Text("Text 2"), Text("Text 3")],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text("Text 1"), Text("Text 2"), Text("Text 3")],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Text 1"), Text("Text 2"), Text("Text 3")],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Text 1"), Text("Text 2"), Text("Text 3")],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text("Text 1"), Text("Text 2"), Text("Text 3")],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Text 1"),
                Text("Text 2"),
                Text("Text 3"),
              ],
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                ),
                FlatButton(onPressed: () {}, child: Text("Action")),
              ],
            ),
            Divider(),
            Row(

              children: [
                FlatButton(onPressed: () {}, child: Text("Action")),
                Expanded(
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                ),
              ],
            ),

          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Row Cheat Sheet",
          style: TextStyle(
            fontFamily: 'NexaBold',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      body: makeBody(),
    );
  }
}
