import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class MyListModel {
  final String title;
  final int amount;
  final ImageProvider image;

  MyListModel({
    @required this.title,
    @required this.amount,
    @required this.image,
  });
}
