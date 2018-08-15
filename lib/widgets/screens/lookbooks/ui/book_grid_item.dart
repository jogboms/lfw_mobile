import 'package:flutter/material.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/models/lookbook.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';
import 'package:glam/widgets/views/image_view.dart';

class BookGridItem extends StatelessWidget {
  final LookbookModel lookbook;

  const BookGridItem({
    Key key,
    this.lookbook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: SizedBox(
        height: 500.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: MkImages.o4,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            Container(
              color: Colors.black87,
              child: MkTouchableOpacity(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      lookbook.title,
                      style: MkTheme.of(context)
                          .subhead1Bold
                          .copyWith(color: Colors.white),
                    ),
                    new Text(
                      '${lookbook.count} items',
                      style: mkFontColor(Colors.white),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push<dynamic>(
                    fadeInRoute(
                      images: [
                        MkImages.o6,
                        MkImages.o2,
                        MkImages.o4,
                        MkImages.o1,
                        MkImages.o6,
                        MkImages.o7,
                        MkImages.o3,
                        MkImages.o5,
                      ],
                      index: 0,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
