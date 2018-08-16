import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/screens/products/product_page.dart';

class MkProductItem extends StatelessWidget {
  final Size size;
  final Brightness brightness;

  const MkProductItem({
    Key key,
    @required this.size,
    this.brightness = Brightness.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyStyle = MkTheme.of(context).body1.copyWith(
          color:
              brightness == Brightness.light ? MkColors.black : MkColors.white,
        );
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: SizedBox.fromSize(
                size: Size(size.width, size.height),
                child: Material(
                  child: new Ink.image(
                    image: MkImages.o4,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    child: new InkWell(
                      onTap: () {
                        Navigator.of(context).push<dynamic>(
                          MkNavigate.slideIn<dynamic>(
                            ProductPage(),
                          ),
                        );
                      },
                      child: SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              "Length Tent Dresstr ereyr",
              style: bodyStyle.copyWith(
                fontWeight: MkStyle.medium,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 4.0),
            Text(
              "N160",
              style: bodyStyle.copyWith(
                fontWeight: MkStyle.semibold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
