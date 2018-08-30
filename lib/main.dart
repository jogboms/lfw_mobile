import 'dart:async' show Future;

import 'package:flutter/widgets.dart';
import 'package:glam/widgets/app.dart';

void main() async {
  // TODO: only for demo purposes
  await Future<dynamic>.delayed(Duration(seconds: 4));

  runApp(new App());
}
