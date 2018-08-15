import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class StoryModel {
  final String title;
  final String author;
  final DateTime createdAt;
  final ImageProvider image;

  StoryModel({
    @required this.title,
    @required this.author,
    @required this.image,
    DateTime createdAt,
  }) : createdAt = DateTime.now();
}
