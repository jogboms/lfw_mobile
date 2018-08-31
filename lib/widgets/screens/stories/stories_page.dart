import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/models/story.dart';
import 'package:glam/utils/mk_sliver_separator_builder_delegate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_burger_bar.dart';
import 'package:glam/widgets/partials/mk_tab_persistent_header.dart';
import 'package:glam/widgets/screens/stories/ui/story_list_item.dart';
import 'package:glam/widgets/views/side_bar_drawer.dart';

class StoriesPage extends StatefulWidget {
  @override
  _StoriesPageState createState() => new _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  final List<Tab> tabs = [
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
                  title: Text(
                    "Stories",
                    style: MkTheme.of(context).display3,
                  ),
                ),
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

  Builder _buildBody({
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
            SliverToBoxAdapter(child: SizedBox(height: 24.0)),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 56.0),
              sliver: SliverList(
                delegate: MkSliverSeparatorBuilderDelegate(
                  childCount: stories.length,
                  builder: (BuildContext context, int index) {
                    return StoryListItem(story: stories[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(height: 32.0);
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
