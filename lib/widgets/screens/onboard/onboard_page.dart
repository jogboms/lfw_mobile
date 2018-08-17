import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_clear_button.dart';
import 'package:glam/widgets/screens/login/login_page.dart';

class OnboardPage extends StatefulWidget {
  @override
  OnboardPageState createState() => new OnboardPageState();
}

class OnboardPageState extends State<OnboardPage> {
  final List<ImageProvider> images = [
    MkImages.o2,
    MkImages.o4,
    MkImages.o5,
  ];

  final List<String> headers = [
    "Explore",
    "Find",
    "Buy",
  ];

  final List<String> content = [
    "Free Beauty Samples, What They Are And How To Find Them.",
    "Veniam occaecat ex veniam tempor sunt laborum mollit.",
    "Cosmetic Surgery A Review Of Facial Surgery With Personal",
  ];

  final _controller = new SwiperController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
      body: new Swiper(
        itemBuilder: _slideBuilder(media),
        itemCount: 3,
        loop: false,
        pagination: new SwiperCustomPagination(
          builder: (BuildContext context, SwiperPluginConfig config) {
            final _isFinal = config.activeIndex + 1 == config.itemCount;

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: media.padding.top + 16.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "0 ${config.activeIndex + 1}",
                        ),
                        TextSpan(
                          text: "  —  ",
                        ),
                        TextSpan(
                          text: "0 ${config.itemCount}",
                          style: mkFontColor(Colors.grey),
                        ),
                      ],
                    ),
                    style: mkFontMedium(14.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  color: MkColors.black,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  child: MkClearButton(
                    child: Text(
                      _isFinal ? "Get Started" : "Skip",
                      textAlign: TextAlign.center,
                      style: MkTheme.of(context)
                          .button
                          .copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_isFinal) {
                        MkNavigate(context, LoginPage());
                      } else {
                        _controller.move(config.itemCount - 1);
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
        controller: _controller,
        viewportFraction: 0.85,
        scale: 0.9,
      ),
    );
  }

  IndexedWidgetBuilder _slideBuilder(MediaQueryData media) {
    return (BuildContext context, int index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: media.size.height / 2.5,
            height: media.size.height / 1.85,
            child: Material(
              borderRadius: kBorderRadius,
              child: new Image(
                image: images[index],
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            headers[index],
            style: MkTheme.of(context).title,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              content[index],
              textAlign: TextAlign.center,
              style: MkTheme.of(context).body2,
            ),
          ),
        ],
      );
    };
  }
}
