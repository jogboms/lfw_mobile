import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/constants/mk_images.dart';
import 'package:lfw_mobile/utils/mk_navigate.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';
import 'package:lfw_mobile/widgets/screens/login/login_page.dart';

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
                  child: CupertinoButton(
                    child: Text(
                      _isFinal ? "Get Started" : "Skip",
                      textAlign: TextAlign.center,
                      style: mkFontMedium(16.0, Colors.white),
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
        viewportFraction: 0.75,
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
            width: media.size.height / 2.9,
            child: Material(
              borderRadius: BorderRadius.circular(5.0),
              child: new Image(
                image: images[index],
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            headers[index],
            style: mkFontMedium(20.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Text(
              content[index],
              style: mkFontSize(14.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    };
  }
}
