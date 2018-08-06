import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/constants/mk_icons.dart';
import 'package:lfw_mobile/constants/mk_images.dart';
import 'package:lfw_mobile/utils/mk_navigate.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';
import 'package:lfw_mobile/widgets/partials/mk_clear_button.dart';
import 'package:lfw_mobile/widgets/partials/mk_primary_button.dart';
import 'package:lfw_mobile/widgets/screens/events/event_page.dart';
import 'package:lfw_mobile/widgets/screens/events/ui/swiper_mode.dart';

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
            child: Icon(MkIcons.Loupe, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Events", style: mkFontMedium(32.0, Colors.white)),
              SizedBox(height: 24.0),
              Expanded(
                child: LayoutBuilder(
                  builder: (_, BoxConstraints constraints) {
                    return SwiperMode(
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
                    );
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  MkPrimaryButton(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text("Explore"),
                    onPressed: () {
                      MkNavigate(
                        context,
                        EventPage(
                          tag: "tagger-$activeIndex",
                          image: images[activeIndex],
                          title: headers[activeIndex],
                        ),
                      );
                    },
                  ),
                  Expanded(child: SizedBox()),
                  MkClearButton(
                    child: Icon(MkIcons.Arrow___Left, color: Colors.white),
                    onPressed: () {
                      _controller.previous();
                    },
                  ),
                  MkClearButton(
                    child: Icon(MkIcons.Arrow___Right, color: Colors.white),
                    onPressed: () {
                      _controller.next();
                    },
                  ),
                ],
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
