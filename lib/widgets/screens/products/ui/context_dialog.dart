import 'package:flutter/material.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_back_home_button.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';

class ContextDialog extends StatelessWidget {
  const ContextDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: kBorderRadius,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MkTouchableOpacity(
                child: Text(
                  "Show More Text",
                  style: MkTheme.of(context).bodyMedium,
                ),
                onPressed: () {},
              ),
              MkBackHomeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
