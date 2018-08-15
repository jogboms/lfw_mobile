import 'package:flutter/material.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/models/story.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/screens/events/event_page.dart';

class StoryListItem extends StatelessWidget {
  final StoryModel story;

  const StoryListItem({
    Key key,
    @required this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MkNavigate(
          context,
          EventPage(
            tag: "tagger-${story.title}",
            image: story.image,
            title: story.title,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: SizedBox.fromSize(
              size: Size.fromHeight(140.0),
              child: Image(
                image: story.image,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            story.title,
            style: MkTheme.of(context).subhead1,
          ),
          SizedBox(height: 2.0),
          Text(
            "${story.author}  |  23 . 08 . 18",
            style: MkTheme.of(context).body1.copyWith(color: kHintColor),
          ),
        ],
      ),
    );
  }
}
