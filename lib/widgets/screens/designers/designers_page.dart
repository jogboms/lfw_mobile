import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_burger_bar.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';
import 'package:glam/widgets/screens/designers/designer_page.dart';
import 'package:glam/widgets/views/side_bar_drawer.dart';

class DesignersPage extends StatefulWidget {
  @override
  _DesignersPageState createState() => new _DesignersPageState();
}

class _DesignersPageState extends State<DesignersPage> {
  final List<Tab> tabs = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ].map((alpha) => Tab(text: "$alpha")).toList();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MkBurgerBar(
        currentPage: MkPages.Stories,
      ),
      body: new DefaultTabController(
        length: tabs.length,
        child: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: _buildAppBar(innerBoxIsScrolled),
              ),
            ];
          },
          body: SafeArea(
            top: false,
            child: new TabBarView(
              children: tabs.map<Widget>(
                (tab) {
                  return _buildBody(title: tab.text);
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody({
    String title,
  }) {
    return new Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          key: new PageStorageKey<String>("page"),
          slivers: <Widget>[
            new SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                context,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.fromLTRB(28.0, 8.0, 28.0, 8.0),
                color: MkColors.light_grey.withOpacity(.25),
                child: Text(title, style: MkTheme.of(context).subhead1),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                0.0,
                16.0,
                0.0,
                56.0,
              ),
              sliver: SliverGrid(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.82,
                ),
                delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return MkTouchableOpacity(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: MkImages.img_1,
                              radius: 32.0,
                            ),
                            SizedBox(height: 12.0),
                            SizedBox(
                              width: 64.0,
                              child: Text(
                                "Mai Atafo",
                                style: MkTheme.of(context).small.copyWith(
                                      fontWeight: MkStyle.semibold,
                                      height: 1.05,
                                    ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        MkNavigate(context, DesignerPage());
                      },
                    );
                  },
                  childCount: 20,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildAppBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: MkColors.white,
      // floating: true,
      // snap: true,
      pinned: true,
      primary: false,
      forceElevated: innerBoxIsScrolled,
      title: innerBoxIsScrolled
          ? null
          : Text(
              "Designers",
              style: MkTheme.of(context).display3,
            ),
      bottom: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: MkColors.black.shade900,
            labelStyle: MkTheme.of(context).subhead1,
            labelColor: kTextBaseColor,
            unselectedLabelColor: kHintColor,
            tabs: tabs,
          ),
        ),
        preferredSize: Size.fromHeight(
          innerBoxIsScrolled ? 0.0 : kTextTabBarHeight,
        ),
      ),
    );
  }
}
