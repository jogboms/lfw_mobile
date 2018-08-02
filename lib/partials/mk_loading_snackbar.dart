import 'package:flutter/material.dart';

class MkLoadingSnackBar extends SnackBar {
  MkLoadingSnackBar({Key key, Widget content})
      : super(
          key: key,
          content: Row(
            children: [
              new CircularProgressIndicator(),
              SizedBox(width: 16.0),
              content ??
                  new Text(
                    "Please wait...",
                    style: TextStyle(color: Colors.white.withOpacity(.75)),
                  ),
            ],
          ),
          duration: Duration(days: 1),
        );
}
