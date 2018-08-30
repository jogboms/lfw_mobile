import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MkStatusBar extends StatelessWidget {
  final Widget child;
  final Brightness brightness;

  const MkStatusBar({
    Key key,
    this.brightness = Brightness.dark,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AnnotatedRegion<SystemUiOverlayStyle>(
      value: brightness == Brightness.dark
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: child,
    );
  }
}
