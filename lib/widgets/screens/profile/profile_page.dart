import 'package:flutter/material.dart';
import 'package:glam/constants/mk_icons.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_burger_bar.dart';
import 'package:glam/widgets/partials/mk_clear_button.dart';
import 'package:glam/widgets/partials/mk_drawer.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';
import 'package:glam/widgets/screens/profile/my_list/my_list_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MkBurgerBar(
        currentPage: MkPages.Profile,
        shouldSearch: false,
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
                      "Profile",
                      style: MkTheme.of(context).display3,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  _buildAvatarBar(context),
                  SizedBox(height: 48.0),
                  Divider(height: 0.0),
                  _buildCenterBlock(),
                  Divider(height: 0.0),
                  SizedBox(height: 48.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarBar(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 32.0),
        CircleAvatar(
          radius: 39.0,
          backgroundColor: kHintColor,
          child: Align(
            alignment: Alignment(1.15, 1.05),
            child: SizedBox.fromSize(
              size: Size.square(28.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: MkTouchableOpacity(
                  child: Icon(
                    MkIcons.Camera,
                    size: 14.0,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Jeremiah Ogbomo",
              style: MkTheme.of(context).title,
            ),
            SizedBox(height: 8.0),
            Text(
              "Designer",
              style: MkTheme.of(context).subhead3,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildCenterBlock() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: <Widget>[
          _buildListTile(
            icon: MkIcons.User_Alt,
            text: "Bio Data",
            onPressed: () {},
          ),
          Divider(height: 0.0, indent: 24.0),
          _buildListTile(
            icon: MkIcons.Book___Alt,
            text: "My Orders ",
            onPressed: () {},
          ),
          Divider(height: 0.0, indent: 24.0),
          _buildListTile(
            icon: MkIcons.Heart,
            text: "My List",
            onPressed: () {
              Navigator.of(context).push<dynamic>(
                MkNavigate.slideIn<dynamic>(new MyListPage()),
              );
            },
          ),
          Divider(height: 0.0, indent: 24.0),
          _buildListTile(
            icon: MkIcons.Alarm,
            text: "Notifications",
            onPressed: () {},
          ),
          Divider(height: 0.0, indent: 24.0),
          _buildListTile(
            icon: MkIcons.Sign_Out,
            text: "Sign Out",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  ListTile _buildListTile({
    IconData icon,
    String text,
    VoidCallback onPressed,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 24.0),
      leading: Icon(icon),
      title: Text(
        text,
        style: MkTheme.of(context).body3,
      ),
      trailing: MkClearButton(
        child: Icon(MkIcons.Chevron___Right, size: 16.0),
        onPressed: onPressed,
      ),
    );
  }
}
