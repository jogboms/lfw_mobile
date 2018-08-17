import 'package:flutter/material.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';
import 'package:glam/widgets/screens/designers/designer_page.dart';

const _kContentPadding = const EdgeInsets.symmetric(
  horizontal: 24.0,
  vertical: 8.0,
);

class InfoBlock extends StatelessWidget {
  final EdgeInsets contentPadding;

  const InfoBlock({
    Key key,
    this.contentPadding = _kContentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Mini Cami Skater Dress",
                style: MkTheme.of(context).subhead1,
              ),
              SizedBox(height: 2.0),
              MkTouchableOpacity(
                child: Text(
                  "Lanre DaSilva",
                  style: MkTheme.of(context).subhead1Light,
                ),
                onPressed: () {
                  MkNavigate(context, DesignerPage());
                },
              ),
            ],
          ),
          Text(
            "N1600",
            style: MkTheme.of(context).subhead1Bold,
          ),
        ],
      ),
    );
  }
}
