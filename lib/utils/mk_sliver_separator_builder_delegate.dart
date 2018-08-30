import 'dart:math' show max;

import 'package:flutter/widgets.dart';

class MkSliverSeparatorBuilderDelegate extends SliverChildBuilderDelegate {
  MkSliverSeparatorBuilderDelegate({
    @required IndexedWidgetBuilder builder,
    @required IndexedWidgetBuilder separatorBuilder,
    @required int childCount,
  }) : super(
          (BuildContext context, int index) {
            final int itemIndex = index ~/ 2;
            return (index == 0 || index.isEven)
                ? builder(context, itemIndex)
                : separatorBuilder(context, itemIndex);
          },
          childCount: max(0, childCount * 2 - 1),
        );
}
