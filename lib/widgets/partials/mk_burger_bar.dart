import 'package:flutter/material.dart';
import 'package:glam/utils/mk_fade_in_route.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/widgets/partials/mk_burger_button.dart';
import 'package:glam/widgets/views/side_bar_drawer.dart';
import 'package:glam/widgets/partials/mk_search_button.dart';
import 'package:glam/widgets/screens/search/search_page.dart';

class MkBurgerBar extends StatelessWidget implements PreferredSizeWidget {
  final Brightness brightness;
  final MkPages currentPage;
  final bool shouldSearch;

  const MkBurgerBar({
    Key key,
    @required this.currentPage,
    this.brightness = Brightness.light,
    this.shouldSearch = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = brightness == Brightness.light ? Colors.black : Colors.white;
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: brightness,
      elevation: 0.0,
      leading: MkBurgerButton(
        color: _color,
        onPressed: () {
          // showDrawer();
          Navigator.of(context).push<dynamic>(
            mkFadeInRoute(
              builder: (BuildContext context) => SideBarDrawer(
                    brightness: Brightness.dark,
                    currentPage: currentPage,
                  ),
            ),
          );
        },
      ),
      actions: shouldSearch
          ? <Widget>[
              MkSearchButton(
                color: _color,
                onPressed: () {
                  Navigator.of(context).push<dynamic>(
                    MkNavigate.fadeIn<dynamic>(
                      SearchPage(),
                    ),
                  );
                },
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
