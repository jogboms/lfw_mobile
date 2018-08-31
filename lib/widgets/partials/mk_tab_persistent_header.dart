import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_persistent_header_delegate.dart';
import 'package:glam/utils/mk_theme.dart';

class MkTabPersistentHeader extends StatelessWidget {
  final List<Tab> tabs;

  const MkTabPersistentHeader({
    Key key,
    @required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MkPersistentHeaderDelegate(
        builder: (BuildContext context, bool isAtTop) {
          return Material(
            elevation: isAtTop ? 2.0 : 1.0,
            child: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: MkColors.black.shade900,
              labelStyle: MkTheme.of(context).subhead1,
              labelColor: kTextBaseColor,
              unselectedLabelColor: kHintColor,
              tabs: tabs,
            ),
          );
        },
      ),
    );
  }
}
