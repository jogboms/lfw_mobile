import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/models/my_list.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';

class MyListItem extends StatelessWidget {
  final MyListModel item;

  const MyListItem({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: kBorderRadius,
          child: SizedBox(
            height: 124.0,
            child: Image(
              image: MkImages.o4,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // TODO @critical
            Text(
              "My Todo Item",
              // item.title,
              // "item.title item.title item.title item.title item.title item.title item.title item.title item.title item.title ",
              style: MkTheme.of(context).subhead1,
              softWrap: true,
              // maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.0),
            Text(
              "N${item.amount}",
              style: MkTheme.of(context).subhead1Bold,
            ),
            SizedBox(height: 16.0),
            Material(
              borderRadius: kBorderRadius,
              color: MkColors.black,
              child: MkTouchableOpacity(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 32.0,
                    child: Center(
                      child: Text(
                        "Place Order",
                        style: MkTheme.of(context)
                            .button
                            .copyWith(color: MkColors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
