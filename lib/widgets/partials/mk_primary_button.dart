import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';

class MkPrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  const MkPrimaryButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: MkColors.black,
      padding: padding,
      child: DefaultTextStyle(
        style: mkFontMedium(16.0, MkColors.white),
        child: child,
      ),
      onPressed: onPressed,
    );
  }
}
