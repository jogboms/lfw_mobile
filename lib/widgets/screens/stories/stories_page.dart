import 'dart:math' show max;

import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/models/story.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_burger_bar.dart';
import 'package:glam/widgets/views/side_bar_drawer.dart';
import 'package:glam/widgets/screens/stories/ui/story_list_item.dart';

class StoriesPage extends StatefulWidget {
  @override
  _StoriesPageState createState() => new _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  final List<Widget> tabs = [
    Tab(text: "All"),
    Tab(text: "Style Tips"),
    Tab(text: "Event Reviews"),
    Tab(text: "Event Reviews 1"),
    Tab(text: "Event Reviews 2"),
    Tab(text: "Event Reviews 3"),
    Tab(text: "Event Reviews 4"),
  ];

  final List<StoryModel> stories = [
    StoryModel(
      image: MkImages.o4,
      title: "For The Love of Scarfs",
      author: "Jeremiah Ogbomo",
    ),
    StoryModel(
      image: MkImages.o1,
      title: "For The Love of Fashion",
      author: "Ndubuisi Ogbomo",
    ),
    StoryModel(
      image: MkImages.o2,
      title: "For The Love of Fashion",
      author: "Jeremiah Ogbomo",
    ),
    StoryModel(
      image: MkImages.o5,
      title: "For The Love of Fashion",
      author: "Jeremiah Ogbomo",
    ),
    StoryModel(
      image: MkImages.o4,
      title: "For The Love of Fashion",
      author: "Jeremiah Ogbomo",
    ),
    StoryModel(
      image: MkImages.o4,
      title: "For The Love of Fashion",
      author: "Jeremiah Ogbomo",
    ),
    StoryModel(
      image: MkImages.o4,
      title: "For The Love of Fashion",
      author: "Jeremiah Ogbomo",
    ),
    StoryModel(
      image: MkImages.o4,
      title: "For The Love of Fashion",
      author: "Jeremiah Ogbomo",
    ),
  ];

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
                child: SliverAppBar(
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
                          "Stories",
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
                ),
              ),
            ];
          },
          body: SafeArea(
            top: false,
            child: new Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  key: new PageStorageKey<String>("page"),
                  slivers: <Widget>[
                    new SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context,
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 24.0)),
                    SliverPadding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 56.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            final int itemIndex = index ~/ 2;
                            return (index == 0 || index.isEven)
                                ? StoryListItem(story: stories[itemIndex])
                                : new Divider(height: 32.0);
                          },
                          childCount: max(0, stories.length * 2 - 1),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
