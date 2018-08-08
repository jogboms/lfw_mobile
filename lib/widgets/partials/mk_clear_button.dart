import 'package:flutter/cupertino.dart';
import 'package:glam/utils/mk_theme.dart';

class MkClearButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const MkClearButton({
    Key key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: DefaultTextStyle(
        style: MkTheme.of(context).body3,
        child: child,
      ),
      onPressed: onPressed,
    );
  }
}
