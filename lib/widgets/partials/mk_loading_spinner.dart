import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:glam/constants/mk_style.dart';

Widget mkLoadingSpinner({Color color}) {
  return Center(
    child: SpinKitThreeBounce(
      color: color ?? kPrimaryColor,
      size: 30.0,
    ),
  );
}
