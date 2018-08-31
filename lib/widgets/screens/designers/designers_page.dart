import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_burger_bar.dart';
import 'package:glam/widgets/partials/mk_tab_persistent_header.dart';
import 'package:glam/widgets/screens/designers/partials/designer_grid_item.dart';
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
        currentPage: MkPages.Designers,
      ),
      body: new DefaultTabController(
        length: tabs.length,
        child: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: _buildAppBar(),
              ),
              new MkTabPersistentHeader(tabs: tabs),
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
          key: new PageStorageKey<String>("$title"),
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
                8.0,
                16.0,
                8.0,
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
                    return new DesignerGridItem();
                  },
                  childCount: 30,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: MkColors.white,
      title: Text(
        "Designers",
        style: MkTheme.of(context).display3,
      ),
    );
  }
}
