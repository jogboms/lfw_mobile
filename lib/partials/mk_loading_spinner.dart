import 'package:flutter/material.dart';

Widget mkLoadingSpinner({Color color}) {
  return Center(
    child: SizedBox.fromSize(
      size: Size.square(24.0),
      child: CircularProgressIndicator(backgroundColor: color),
    ),
  );
}
