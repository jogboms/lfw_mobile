import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/constants/mk_images.dart';
import 'package:lfw_mobile/constants/mk_theme.dart';

class OnboardPage extends StatefulWidget {
  @override
  OnboardPageState createState() => new OnboardPageState();
}

class OnboardPageState extends State<OnboardPage> {
  final List<ImageProvider> images = [
    MkImages.o1,
    MkImages.o2,
    MkImages.o7,
  ];

  final List<String> headers = [
    "Explore",
    "Find",
    "Buy",
  ];

  final List<String> content = [
    "Free Beauty Samples, What They Are And How To Find Them.",
    "Veniam occaecat ex veniam tempor sunt laborum mollit Lorem nisi aute.",
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
    return Scaffold(
      body: new Swiper(
        itemBuilder: _slideBuilder,
        itemCount: 3,
        loop: false,
        pagination: new SwiperCustomPagination(
          builder: (BuildContext context, SwiperPluginConfig config) {
            final _isFinal = config.activeIndex + 1 == config.itemCount;

            return new SafeArea(
              bottom: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
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
                            style: fontColor(Colors.grey),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Material(
                    color: MkColors.black,
                    child: InkWell(
                      child: SafeArea(
                        top: false,
                        child: SizedBox(
                          height: 46.0,
                          child: Center(
                            child: Text(
                              _isFinal ? "Get Started" : "Skip",
                              textAlign: TextAlign.center,
                              style: fontColor(Colors.white),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (_isFinal) {
                          return print("Yay!");
                        }
                        _controller.move(config.itemCount - 1);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        controller: _controller,
        viewportFraction: 0.75,
        scale: 0.9,
      ),
    );
  }

  Widget _slideBuilder(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).padding.top + 72.0),
        Center(
          child: SizedBox(
            width: 264.0,
            child: Material(
              borderRadius: BorderRadius.circular(15.0),
              child: new Image(
                image: images[index],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: 32.0 * 1.0),
        Text(
          headers[index],
          style: fontSize(24.0),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Text(
            content[index],
            // style: fontSize(24.0),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
