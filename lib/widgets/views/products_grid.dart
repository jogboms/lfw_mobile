import 'package:flutter/material.dart';
import 'package:glam/widgets/partials/mk_product_item.dart';

const _kScrollBarHeight = 228.0;

class ProductsGrid extends StatelessWidget {
  final double height;
  final Brightness brightness;

  const ProductsGrid({
    Key key,
    this.brightness = Brightness.light,
    this.height = _kScrollBarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          final _height = (height / 1.2) - 2.0;
          return MkProductItem(
            brightness: brightness,
            size: Size(_height / 1.3125, _height),
          );
        },
      ),
    );
  }
}
