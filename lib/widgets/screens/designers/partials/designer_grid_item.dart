import 'package:flutter/material.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';
import 'package:glam/widgets/screens/designers/designer_page.dart';

class DesignerGridItem extends StatelessWidget {
  const DesignerGridItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MkTouchableOpacity(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: MkImages.o3,
              radius: 32.0,
            ),
            SizedBox(height: 12.0),
            SizedBox(
              width: 64.0,
              child: Text(
                "Mai Atafo",
                style: MkTheme.of(context).small.copyWith(
                      fontWeight: MkStyle.semibold,
                      height: 1.05,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        MkNavigate(context, DesignerPage());
      },
    );
  }
}
