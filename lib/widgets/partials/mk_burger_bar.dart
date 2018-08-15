import 'package:flutter/material.dart';
import 'package:glam/utils/mk_fade_in_route.dart';
import 'package:glam/widgets/partials/mk_burger_button.dart';
import 'package:glam/widgets/partials/mk_drawer.dart';
import 'package:glam/widgets/partials/mk_search_button.dart';

class MkBurgerBar extends StatelessWidget implements PreferredSizeWidget {
  final Brightness brightness;
  final MkPages currentPage;

  const MkBurgerBar({
    Key key,
    @required this.currentPage,
    this.brightness = Brightness.light,
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
              builder: (BuildContext context) => MkDrawer(
                    brightness: Brightness.dark,
                    currentPage: currentPage,
                  ),
            ),
          );
        },
      ),
      actions: <Widget>[
        MkSearchButton(
          color: _color,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
