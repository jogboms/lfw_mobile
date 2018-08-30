import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';
import 'package:glam/widgets/screens/designers/designer_page.dart';
import 'package:glam/widgets/views/products_grid.dart';

class EventFooter extends StatelessWidget {
  const EventFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyStyle = MkTheme.of(context).body1.copyWith(color: Colors.white);
    return Container(
      color: MkColors.black.shade900,
      padding: EdgeInsets.all(16.0),
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              "Shop The Event",
              style: MkTheme.of(context).subhead1.copyWith(color: Colors.white),
            ),
            SizedBox(height: 24.0),
            ProductsGrid(brightness: Brightness.dark),
            SizedBox(height: 32.0),
            Text(
              "Designers",
              style: MkTheme.of(context).subhead1.copyWith(color: Colors.white),
            ),
            SizedBox(height: 24.0),
            _buidDesignerListItem(
              context: context,
              text: "Zara Nicols",
              style: bodyStyle,
            ),
            Divider(height: 32.0, color: Colors.white.withOpacity(.35)),
            _buidDesignerListItem(
              context: context,
              text: "Jumai Willis",
              style: bodyStyle,
            ),
            Divider(height: 32.0, color: Colors.white.withOpacity(.35)),
            _buidDesignerListItem(
              context: context,
              text: "Mai Atafo",
              style: bodyStyle,
            ),
            Divider(height: 32.0, color: Colors.white.withOpacity(.35)),
            _buidDesignerListItem(
              context: context,
              text: "Mr Jon",
              style: bodyStyle,
            ),
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }

  Widget _buidDesignerListItem({
    BuildContext context,
    String text,
    TextStyle style,
  }) {
    return MkTouchableOpacity(
      child: Text(
        text,
        style: style,
      ),
      onPressed: () {
        MkNavigate(context, DesignerPage());
      },
    );
  }
}
