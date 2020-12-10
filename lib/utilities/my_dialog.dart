
import 'package:flutter/material.dart';


class MyDialog {
  Future<void> showMyDialog(BuildContext con,String heading,String message) async {
    return showDialog<void>(
      context: con,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(heading),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                //Text('This is a demo alert dialog.'),
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[

            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}