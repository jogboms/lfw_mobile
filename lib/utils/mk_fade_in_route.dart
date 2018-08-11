import 'package:flutter/widgets.dart';

PageRouteBuilder<dynamic> mkFadeInRoute({
  @required WidgetBuilder builder,
}) {
  return new PageRouteBuilder<dynamic>(
    opaque: false,
    pageBuilder: (BuildContext context, _, __) => builder(context),
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
