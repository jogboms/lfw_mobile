import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/utils/mk_theme.dart';

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
        style: MkTheme.of(context).button.copyWith(color: MkColors.white),
        child: child,
      ),
      onPressed: onPressed,
    );
  }
}
