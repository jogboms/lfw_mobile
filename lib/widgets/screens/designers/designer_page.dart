import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_icons.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_routes.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_back_button.dart';
import 'package:glam/widgets/partials/mk_clear_button.dart';
import 'package:glam/widgets/partials/mk_products_grid.dart';

class DesignerPage extends StatefulWidget {
  @override
  _DesignerPageState createState() => new _DesignerPageState();
}

class _DesignerPageState extends State<DesignerPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CustomScrollView(
            // shrinkWrap: true,
            slivers: <Widget>[
              _buildAppBar(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 8.0),
                    _buildInfoBlock(),
                    SizedBox(height: 8.0),
                    Divider(height: 0.0),
                    _buildCenterBlock(),
                    Divider(height: 0.0),
                    SizedBox(height: 8.0),
                    _buildRelatedBlock(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCenterBlock() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: <Widget>[
          _buildListTile("Biography", () {}),
          Divider(height: 0.0, indent: 24.0),
          _buildListTile("Company Details", () {}),
          Divider(height: 0.0, indent: 24.0),
          _buildListTile("Contact Details", () {}),
          Divider(height: 0.0, indent: 24.0),
          _buildListTile("Gallery", () {}),
        ],
      ),
    );
  }

  ListTile _buildListTile(String title, VoidCallback onPressed) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 24.0),
      dense: true,
      title: Text(
        title,
        style: MkTheme.of(context).bodyMedium,
      ),
      trailing: MkClearButton(
        child: Icon(MkIcons.Chevron___Right, size: 16.0),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildRelatedBlock() {
    return Container(
      color: MkColors.black.shade900,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Items By This Designer",
            style: MkTheme.of(context).subhead1.copyWith(
                  color: MkColors.white,
                ),
          ),
          SizedBox(height: 16.0),
          MkProductsGrid(brightness: Brightness.dark),
          SizedBox(height: 48.0),
          Center(
            child: MkClearButton(
              child: Text(
                "Back Home",
                style: mkFontColor(Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).popUntil(
                  ModalRoute.withName(MkRoutes.events),
                );
              },
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget _buildInfoBlock() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 0.0, 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Mai Atafo",
                style: MkTheme.of(context).display1,
              ),
              Text(
                "Wedding Apparel",
                style: MkTheme.of(context).body1,
              ),
            ],
          ),
          MkClearButton(
            // padding: EdgeInsets.zero,
            child: Icon(
              MkIcons.Mail,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: MkColors.black.shade900,
      brightness: Brightness.dark,
      leading: MkBackButton(color: Colors.white),
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height / 2.0,
      flexibleSpace: FlexibleSpaceBar(
        background: _buildAppBarBackground(),
      ),
    );
  }

  Widget _buildAppBarBackground() {
    return new Image(
      image: MkImages.o3,
      alignment: Alignment.topCenter,
      fit: BoxFit.cover,
    );
  }
}
