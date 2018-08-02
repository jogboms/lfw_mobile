import 'dart:async' show Future;

import 'package:flutter/material.dart';

Future<T> mkShowChildDialog<T>({
  @required BuildContext context,
  @required Widget child,
}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) => child,
  );
}
