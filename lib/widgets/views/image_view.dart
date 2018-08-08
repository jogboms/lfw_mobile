import 'package:flutter/material.dart';
import 'package:glam/widgets/partials/mk_close_button.dart';
import 'package:glam/widgets/partials/mk_loading_spinner.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  final ImageProvider image;

  const ImageView({
    Key key,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      primary: false,
      backgroundColor: Colors.black87,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new PhotoView(
            imageProvider: image,
            loadingChild: mkLoadingSpinner(),
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
}

PageRouteBuilder<dynamic> fadeInRoute({
  @required ImageProvider image,
}) {
  return new PageRouteBuilder<dynamic>(
    opaque: false,
    pageBuilder: (BuildContext context, _, __) => ImageView(
          image: image,
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
