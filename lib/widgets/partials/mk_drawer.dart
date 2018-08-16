import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_close_button.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';
import 'package:glam/widgets/screens/events/events_page.dart';
import 'package:glam/widgets/screens/lookbooks/lookbooks_page.dart';
import 'package:glam/widgets/screens/profile/profile_page.dart';
import 'package:glam/widgets/screens/stories/stories_page.dart';

enum MkPages {
  Events,
  Designers,
  Lookbooks,
  Stories,
  Contact,
  Profile,
}

const double _kPadLeft = 48.0;

class MkDrawer extends StatelessWidget {
  final Brightness brightness;
  final MkPages currentPage;

  const MkDrawer({
    Key key,
    @required this.currentPage,
    this.brightness = Brightness.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = MkTheme.of(context);
    final _color = brightness == Brightness.dark ? MkColors.white : null;
    final _listStyle = _theme.display2.copyWith(color: _color);

    return new AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Drawer(
        child: Container(
          color: brightness == Brightness.dark
              ? MkColors.black.shade900
              : MkColors.white,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MkCloseButton(color: _color),
                _buildItemLists(context, _listStyle),
                Padding(
                  padding: const EdgeInsets.only(left: _kPadLeft, bottom: 36.0),
                  child: MkTouchableOpacity(
                    child: Text(
                      "Jeremiah Ogbomo",
                      style: _theme.subhead3.copyWith(color: _color),
                    ),
                    onPressed: () {
                      if (MkPages.Profile == currentPage) {
                        Navigator.of(context).pop();
                        return;
                      }

                      Navigator.of(context).push<dynamic>(
                        MkNavigate.slideIn<dynamic>(
                          ProfilePage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    BuildContext context,
    String text,
    TextStyle style,
    MkPages page,
    Widget widget,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: _kPadLeft),
      child: MkTouchableOpacity(
        child: Text(
          text,
          style: style,
        ),
        onPressed: () {
          if (page == currentPage) {
            Navigator.of(context).pop();
            return;
          }
          Navigator.of(context).push<dynamic>(
            MkNavigate.slideIn<dynamic>(widget),
          );
        },
      ),
    );
  }

  Widget _buildItemLists(BuildContext context, TextStyle style) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildListTile(
          context: context,
          text: "Events",
          widget: new EventsPage(),
          page: MkPages.Events,
          style: style,
        ),
        SizedBox(height: 32.0),
        _buildListTile(
          context: context,
          text: "Designers",
          widget: new LookbooksPage(),
          page: MkPages.Designers,
          style: style,
        ),
        SizedBox(height: 32.0),
        _buildListTile(
          context: context,
          text: "Lookbooks",
          widget: new LookbooksPage(),
          page: MkPages.Lookbooks,
          style: style,
        ),
        SizedBox(height: 32.0),
        _buildListTile(
          context: context,
          text: "Stories",
          widget: new StoriesPage(),
          page: MkPages.Stories,
          style: style,
        ),
        SizedBox(height: 32.0),
        _buildListTile(
          context: context,
          text: "Contact",
          widget: new LookbooksPage(),
          page: MkPages.Contact,
          style: style,
        ),
      ],
    );
  }
}
