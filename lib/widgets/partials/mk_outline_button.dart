import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';

class MkOutlineButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  const MkOutlineButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: padding,
      child: DefaultTextStyle(
        style: mkFontMedium(16.0, MkColors.black),
        child: child,
      ),
      onPressed: onPressed,
      borderSide: BorderSide(color: MkColors.black, width: 2.5),
    );
  }
}
