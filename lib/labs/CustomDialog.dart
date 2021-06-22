
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  CustomDialog({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyState createState() => MyState();
}

class MyState extends State<CustomDialog> {

  @override
  Widget build(BuildContext context) {
    Widget body(context) {
      return Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              "Custom Dialog Title",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'This is a ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'NexaLight',
                      )),
                  TextSpan(
                      text: "custom alert dialog ",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.0,
                      )),
                  TextSpan(
                      text: ' with flutter by DevByBit',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w400)),
                ])),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w400)),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    //submit action
                  },
                  textColor: Colors.white,
                  color: Colors.blue,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NexaBold',
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Dialog"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("DevByBit"),
                      content: new Text("This is a dialog message"),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Ok"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Default dialog"),
            ),
            FlatButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          insetPadding: EdgeInsets.all(10),
                          child: body(context));
                    });
              },
              child: Text("Custom dialog"),
            )
          ],
        ),
      ),

    );
  }
}