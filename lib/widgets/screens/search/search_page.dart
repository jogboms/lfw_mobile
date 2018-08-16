import 'package:flutter/material.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_close_button.dart';
import 'package:glam/widgets/screens/designers/designer_page.dart';
import 'package:glam/widgets/screens/events/event_page.dart';
import 'package:glam/widgets/views/image_view.dart';
import 'package:glam/widgets/views/products_grid.dart';

class SearchPage extends StatefulWidget {
  final divider = const Divider(height: 4.0);

  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [];

    _children.add(SizedBox(height: 8.0));

    _children.add(
      _buildListTile(
        text: "Mai Atafo",
        type: "D",
        onTap: () {
          MkNavigate(context, DesignerPage());
        },
      ),
    );

    _children.add(widget.divider);

    _children.add(
      _buildListTile(
        text: "A/W 18 Lookbook",
        type: "L",
        onTap: () {
          Navigator.of(context).push<dynamic>(
            fadeInRoute(
              images: [
                MkImages.o6,
                MkImages.o2,
                MkImages.o4,
                MkImages.o1,
                MkImages.o6,
                MkImages.o7,
                MkImages.o3,
                MkImages.o5,
              ],
              index: 0,
            ),
          );
        },
      ),
    );

    _children.add(widget.divider);

    _children.add(
      _buildListTile(
        text: "Styling The Royal Wedding",
        type: "S",
        onTap: () {
          MkNavigate(
            context,
            EventPage(
              tag: "tagger-Styling",
              image: MkImages.o6,
              title: "Styling The Royal Wedding",
            ),
          );
        },
      ),
    );

    _children.add(widget.divider);

    _children.add(
      _buildListTile(
        text: "LFW 2018",
        type: "E",
        onTap: () {
          MkNavigate(
            context,
            EventPage(
              tag: "tagger-LFW",
              image: MkImages.o2,
              title: "LFW 2018",
            ),
          );
        },
      ),
    );

    _children.add(widget.divider);

    _children.addAll(_buildProductBlock());

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: kAccentColor,
        brightness: Brightness.light,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [MkCloseButton()],
        bottom: _buildSearchBar(),
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                _children,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildProductBlock() {
    return [
      ListTile(
        title: Text(
          "Products",
          style: MkTheme.of(context).subhead3,
        ),
        trailing: Text(
          "30",
          style: MkTheme.of(context).subhead3.copyWith(
                color: kHintColor,
              ),
        ),
      ),
      SizedBox(height: 4.0),
      ProductsGrid(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    ];
  }

  ListTile _buildListTile({
    String text,
    String type,
    VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        text,
        style: MkTheme.of(context).subhead3,
      ),
      trailing: Text(
        type,
        style: MkTheme.of(context).subhead3.copyWith(
              color: kHintColor,
            ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildSearchBar() {
    return PreferredSize(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: MkTheme.of(context).textfield,
            contentPadding: EdgeInsets.only(bottom: 14.0),
          ),
          textInputAction: TextInputAction.search,
          style: MkTheme.of(context).body1,
        ),
        // ),
      ),
      preferredSize: Size.fromHeight(36.0),
    );
  }
}
