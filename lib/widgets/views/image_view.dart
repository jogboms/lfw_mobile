import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
            pagination: _buildPagination(),
          ),
          Positioned.fill(
            top: 0.0,
            bottom: null,
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

  SwiperCustomPagination _buildPagination() {
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Align(
            alignment: Alignment(1.0, 0.95),
            child: new Row(
              key: key,
              children: list,
            ),
          ),
        );
      },
    );
  }

  Widget _slideBuilder(BuildContext context, int index) {
    return new PhotoView(
      imageProvider: images[index],
      loadingChild: mkLoadingSpinner(),
    );
  }
}

PageRouteBuilder<dynamic> fadeInRoute({
  @required List<ImageProvider> images,
  @required int index,
}) {
  return new PageRouteBuilder<dynamic>(
    opaque: false,
    pageBuilder: (BuildContext context, _, __) => ImageView(
          images: images,
          index: index,
        ),
    transitionsBuilder: (
      _,
      Animation<double> animation,
      __,
      Widget child,
    ) =>
        new FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}
