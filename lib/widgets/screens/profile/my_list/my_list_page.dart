import 'dart:math' show max;

import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/models/my_list.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_back_button.dart';
import 'package:glam/widgets/screens/profile/my_list/my_list_item.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => new _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  final List<MyListModel> listItems = [
    MyListModel(
      title: "Adjustable Strap Jersey Cami Bodycon Dress",
      image: MkImages.o2,
      amount: 1623,
    ),
    MyListModel(
      title: "Shoulder Sundress with Shirring in Parrot Print",
      image: MkImages.o2,
      amount: 1623,
    ),
    MyListModel(
      title: "Scallop Trim Cami Dress",
      image: MkImages.o2,
      amount: 1623,
    ),
    MyListModel(
      title: "Shoulder Sundress with Shirring in Parrot Print",
      image: MkImages.o2,
      amount: 1623,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: kAccentColor,
        brightness: Brightness.light,
        elevation: 0.0,
        leading: MkBackButton(),
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "My List",
                      style: MkTheme.of(context).display3,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Container(
                    height: 48.0,
                    color: MkColors.black,
                    child: Center(
                      child: Text(
                        '${listItems.length} Items',
                        style: MkTheme.of(context)
                            .subhead3
                            .copyWith(color: MkColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final int itemIndex = index ~/ 2;
                      return (index == 0 || index.isEven)
                          ? MyListItem(item: listItems[itemIndex])
                          : new Divider(height: 32.0);
                    },
                    childCount: max(0, listItems.length * 2 - 1),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
