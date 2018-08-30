import 'package:flutter/material.dart';

class PlaceholderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
				brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Text("NOT IMPLEMENTED"),
      ),
    );
  }
}
