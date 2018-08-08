import 'package:flutter/material.dart';
import 'package:glam/constants/mk_icons.dart';
import 'package:glam/widgets/partials/mk_clear_button.dart';

class MkCloseButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPop;

  const MkCloseButton({
    Key key,
    this.color,
    this.onPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MkClearButton(
      child: new Icon(
        MkIcons.Cross,
        color: color,
      ),
      onPressed: onPop ?? () => Navigator.maybePop(context),
    );
  }
}
