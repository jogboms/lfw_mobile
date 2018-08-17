import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_theme.dart';

class SwiperMode extends StatefulWidget {
  final double height;
  final double width;
  final SwiperController controller;
  final void Function(int) onIndexChanged;
  final void Function(int) onTapped;
  final List<ImageProvider> images;
  final List<String> headers;
  final List<String> content;

  const SwiperMode({
    Key key,
    this.controller,
    this.onIndexChanged,
    this.width,
    this.height,
    this.images,
    this.headers,
    this.content,
    this.onTapped,
  }) : super(key: key);

  @override
  SwiperModeState createState() => new SwiperModeState();
}

class SwiperModeState extends State<SwiperMode> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return new Swiper(
      itemBuilder: _slideBuilder(media),
      itemCount: 3,
      onTap: widget.onTapped,
      controller: widget.controller,
      onIndexChanged: widget.onIndexChanged,
      viewportFraction: 0.85,
      containerHeight: widget.height,
      autoplay: true,
      duration: 1500,
      autoplayDelay: 10000,
      fade: 0.15,
    );
  }

  IndexedWidgetBuilder _slideBuilder(MediaQueryData media) {
    return (BuildContext context, int index) {
      return Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: kBorderRadius,
                child: SizedBox(
                  width: widget.width / 1.325,
                  height: widget.height / 1.445,
                  child: Material(
                    child: Hero(
                      tag: "tagger-$index",
                      child: new Image(
                        image: widget.images[index],
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            LayoutBuilder(
              builder: (_, BoxConstraints constraints) {
                return SizedBox(
                  width: constraints.maxWidth / 1.15,
                  child: Text(
                    widget.headers[index],
                    style: MkTheme.of(context)
                        .display2
                        .copyWith(color: Colors.white),
                  ),
                );
              },
            ),
            SizedBox(height: 24.0),
            Text(
              widget.content[index],
              style: MkTheme.of(context).subhead2.copyWith(color: Colors.white),
            ),
          ],
        ),
      );
    };
  }
}
