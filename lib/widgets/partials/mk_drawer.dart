import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_close_button.dart';

const double _kPadLeft = 48.0;

class MkDrawer extends StatelessWidget {
  final Brightness brightness;

  const MkDrawer({
    Key key,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MkCloseButton(color: _color),
                SizedBox(height: 56.0),
                _buildListTile(
                  text: "Events",
                  onTap: () {},
                  style: _listStyle,
                ),
                SizedBox(height: 32.0),
                _buildListTile(
                  text: "Designers",
                  onTap: () {},
                  style: _listStyle,
                ),
                SizedBox(height: 32.0),
                _buildListTile(
                  text: "Lookbooks",
                  onTap: () {},
                  style: _listStyle,
                ),
                SizedBox(height: 32.0),
                _buildListTile(
                  text: "Stories",
                  onTap: () {},
                  style: _listStyle,
                ),
                SizedBox(height: 32.0),
                _buildListTile(
                  text: "Contact",
                  onTap: () {},
                  style: _listStyle,
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(left: _kPadLeft),
                  child: Text(
                    "Jeremiah Ogbomo",
                    style: _theme.subhead3.copyWith(color: _color),
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile _buildListTile({
    String text,
    TextStyle style,
    VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: _kPadLeft),
      title: Text(
        text,
        style: style,
      ),
      onTap: onTap,
    );
  }
}
