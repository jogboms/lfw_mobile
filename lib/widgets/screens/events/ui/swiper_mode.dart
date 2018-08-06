import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';

class SwiperMode extends StatefulWidget {
  final double height;
  final SwiperController controller;
  final void Function(int) onIndexChanged;
  final List<ImageProvider> images;
  final List<String> headers;
  final List<String> content;

  const SwiperMode({
    Key key,
    this.controller,
    this.onIndexChanged,
    this.height,
    this.images,
    this.headers,
    this.content,
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
      loop: false,
      controller: widget.controller,
      onIndexChanged: widget.onIndexChanged,
      viewportFraction: 0.95,
      containerHeight: widget.height,
      scale: 0.95,
    );
  }

  IndexedWidgetBuilder _slideBuilder(MediaQueryData media) {
    return (BuildContext context, int index) {
      return Align(
        // alignment: Alignment.centerLeft,
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: widget.height / 2.25,
              child: Material(
                borderRadius: BorderRadius.circular(5.0),
                child: Hero(
                  tag: "tagger-$index",
                  child: new Image(
                    image: widget.images[index],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            LayoutBuilder(
              builder: (_, BoxConstraints constraints) {
                return SizedBox(
                  width: constraints.maxWidth / 1.5,
                  child: Text(
                    widget.headers[index],
                    style: mkFont(24.0, Colors.white),
                  ),
                );
              },
            ),
            SizedBox(height: 42.0),
            Text(
              widget.content[index],
              style: mkFont(14.0, Colors.white),
            ),
          ],
        ),
      );
    };
  }
}
