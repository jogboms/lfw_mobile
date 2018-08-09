import 'package:flutter/widgets.dart';
import 'package:glam/constants/mk_icons.dart';
import 'package:glam/widgets/partials/mk_clear_button.dart';

class MkSearchButton extends MkClearButton {
  MkSearchButton({
    Key key,
    Color color,
    VoidCallback onPressed,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: Icon(
            MkIcons.Loupe___Alt__2,
            color: color,
          ),
        );
}
