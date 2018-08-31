import 'package:flutter/material.dart';

class MkPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget Function(BuildContext context, bool isAtTop) builder;

  const MkPersistentHeaderDelegate({
    @required this.builder,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return builder(context, shrinkOffset != 0);
  }

  @override
  double get maxExtent => kTextTabBarHeight;

  @override
  double get minExtent => kTextTabBarHeight;

  @override
  bool shouldRebuild(MkPersistentHeaderDelegate oldDelegate) => true;
}
