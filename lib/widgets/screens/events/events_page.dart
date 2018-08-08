import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_icons.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_clear_button.dart';
import 'package:glam/widgets/partials/mk_primary_button.dart';
import 'package:glam/widgets/screens/events/event_page.dart';
import 'package:glam/widgets/screens/events/ui/swiper_mode.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => new _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final _controller = new SwiperController();
  int activeIndex = 0;
  final List<ImageProvider> images = [
    MkImages.o2,
    MkImages.o4,
    MkImages.o5,
  ];

  final List<String> headers = [
    "Lagos Fashion & Design Week 2017",
    "Lagos Fashion & Design Week 2019",
    "Lagos Fashion & Design Week 2018",
  ];

  final List<String> content = [
    "See the best of the event.",
    "See the best of the event.",
    "See the best of the event.",
  ];

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: MkColors.black.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: MkClearButton(
          child: Icon(MkIcons.List___Alt, color: Colors.white),
          onPressed: () {},
        ),
        actions: <Widget>[
          MkClearButton(
            child: Icon(MkIcons.Loupe___Alt, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Events",
                style: MkTheme.of(context).display3.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            SizedBox(height: 24.0),
            Expanded(
              child: LayoutBuilder(
                builder: (_, BoxConstraints constraints) {
                  return Padding(
                    // padding: const EdgeInsets.only(right: 16.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SwiperMode(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      controller: _controller,
                      images: images,
                      headers: headers,
                      content: content,
                      onIndexChanged: (index) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                      onTapped: _onTapItem,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: <Widget>[
                  MkPrimaryButton(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text("Explore"),
                    onPressed: () {
                      _onTapItem(activeIndex);
                    },
                  ),
                  Expanded(child: SizedBox()),
                  MkClearButton(
                    child: Icon(MkIcons.Chevon___Left, color: Colors.white),
                    onPressed: () {
                      _controller.previous();
                    },
                  ),
                  MkClearButton(
                    child: Icon(MkIcons.Chevron___Right, color: Colors.white),
                    onPressed: () {
                      _controller.next();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  void _onTapItem(int index) {
    MkNavigate(
      context,
      EventPage(
        tag: "tagger-$activeIndex",
        image: images[index],
        title: headers[index],
      ),
    );
  }
}