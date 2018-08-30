import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_fade_in_route.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_close_button.dart';
import 'package:glam/widgets/partials/mk_loading_spinner.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  final List<ImageProvider> images;
  final int index;

  const ImageView({
    Key key,
    @required this.images,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return new Scaffold(
      primary: false,
      backgroundColor: Colors.black87,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Swiper(
            loop: false,
            itemBuilder: _slideBuilder,
            itemCount: images.length,
            index: index,
            pagination: _buildPagination(media),
            // control: new SwiperControl(),
          ),
          Positioned.fill(
            top: 0.0,
            bottom: null,
            // TODO iPhone X
            child: AppBar(
              brightness: Brightness.dark,
              backgroundColor: Colors.black26,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              actions: [
                MkCloseButton(color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwiperCustomPagination _buildPagination(MediaQueryData media) {
    return new SwiperCustomPagination(
      builder: (BuildContext context, SwiperPluginConfig config) {
        final List<Widget> list = [];
        const padding = 4.0;
        for (int i = 0; i < config.itemCount; ++i) {
          final bool active = i == config.activeIndex;
          list.add(SizedBox(
            width: (MediaQuery.of(context).size.width - (padding * 2)) /
                config.itemCount,
            height: 2.0,
            child: Container(
              color: active ? Colors.white : Colors.transparent,
            ),
          ));
        }
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0 + 2.0, left: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "0 ${config.activeIndex + 1}  —  ",
                      ),
                      TextSpan(
                        text: "0 ${config.itemCount}",
                        style: mkFontColor(Colors.grey),
                      ),
                    ],
                  ),
                  style: MkTheme.of(context).subhead3.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: new Row(
                  key: key,
                  children: list,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _slideBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        new PhotoView(
          imageProvider: images[index],
          loadingChild: mkLoadingSpinner(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black26,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
            child: Text(
              "Caption",
              style: MkTheme.of(context).body1.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

PageRouteBuilder<dynamic> fadeInRoute({
  @required List<ImageProvider> images,
  @required int index,
}) {
  return mkFadeInRoute(
    builder: (context) => ImageView(
          images: images,
          index: index,
        ),
  );
}
