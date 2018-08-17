import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_back_button.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';
import 'package:glam/widgets/screens/designers/designer_page.dart';
import 'package:glam/widgets/views/image_view.dart';
import 'package:glam/widgets/views/products_grid.dart';

class EventPage extends StatefulWidget {
  final String tag;
  final ImageProvider image;
  final String title;

  const EventPage({
    Key key,
    this.tag,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  EventPageState createState() => new EventPageState();
}

class EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: MkColors.black.shade900,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildBody(),
              _buildFooter(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    final bodyStyle = MkTheme.of(context).body1.copyWith(color: Colors.white);
    return Container(
      color: MkColors.black.shade900,
      padding: EdgeInsets.all(16.0),
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              "Shop The Event",
              style: MkTheme.of(context).subhead1.copyWith(color: Colors.white),
            ),
            SizedBox(height: 24.0),
            ProductsGrid(brightness: Brightness.dark),
            SizedBox(height: 32.0),
            Text(
              "Designers",
              style: MkTheme.of(context).subhead1.copyWith(color: Colors.white),
            ),
            SizedBox(height: 24.0),
            _buidDesignerListItem(text: "Zara Nicols", style: bodyStyle),
            Divider(height: 32.0, color: Colors.white.withOpacity(.35)),
            _buidDesignerListItem(text: "Jumai Willis", style: bodyStyle),
            Divider(height: 32.0, color: Colors.white.withOpacity(.35)),
            _buidDesignerListItem(text: "Mai Atafo", style: bodyStyle),
            Divider(height: 32.0, color: Colors.white.withOpacity(.35)),
            _buidDesignerListItem(text: "Mr Jon", style: bodyStyle),
            SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }

  Widget _buidDesignerListItem({
    String text,
    TextStyle style,
  }) {
    return MkTouchableOpacity(
      child: Text(
        text,
        style: style,
      ),
      onPressed: () {
        MkNavigate(context, DesignerPage());
      },
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 24.0),
          Text(
            widget.title,
            style: MkTheme.of(context).display2,
          ),
          SizedBox(height: 16.0),
          Text(
            "November 2018",
            style: MkTheme.of(context)
                .body3
                .copyWith(color: MkColors.black.shade700),
          ),
          SizedBox(height: 24.0),
          Text(
            "The most common alloys added to gold to produce white gold are nickel, palladium and silver. Most white gold jewelry is also given an electroplated rhodium coating to intensify brightness.",
            style: MkTheme.of(context).body2,
          ),
          SizedBox(height: 24.0),
          Text(
            "If you are an infrequent traveler you may need some tips to keep the wife. ",
            style: MkTheme.of(context).body2,
          ),
          SizedBox(height: 24.0),
          SizedBox(
            height: 164.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ClipRRect(
                    borderRadius: kBorderRadius,
                    child: Container(
                      width: 124.0,
                      child: Material(
                        borderRadius: kBorderRadius,
                        child: new Ink.image(
                          image: MkImages.o4,
                          fit: BoxFit.cover,
                          child: new InkWell(
                            onTap: () {
                              Navigator.of(context).push<dynamic>(
                                fadeInRoute(
                                  images: [
                                    MkImages.o4,
                                    MkImages.o4,
                                    MkImages.o4,
                                    MkImages.o4,
                                    MkImages.o4,
                                  ],
                                  index: index,
                                ),
                              );
                            },
                            child: SizedBox(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            "Happy while you are jet setting around the globe many individuals.",
            style: MkTheme.of(context).body2,
          ),
          SizedBox(height: 32.0),
          Text(
            "fashion, collection, magazine",
            style: MkTheme.of(context).bodyHint,
          ),
          SizedBox(height: 32.0),
          Divider(),
          SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Text("Share With", style: MkTheme.of(context).bodyMedium),
              Expanded(child: SizedBox()),
              Icon(Icons.sentiment_dissatisfied),
              Icon(Icons.sentiment_neutral),
              Icon(Icons.sentiment_satisfied),
              Icon(Icons.sentiment_very_satisfied),
            ],
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      backgroundColor: MkColors.black.shade900,
      brightness: Brightness.dark,
      expandedHeight: MediaQuery.of(context).size.height / 1.28,
      leading: MkBackButton(color: Colors.white),
      pinned: true,
      centerTitle: true,
      // title: Text(
      //   widget.title,
      //   style: MkTheme.of(context).body1.copyWith(color: Colors.white),
      // ),
      flexibleSpace: new FlexibleSpaceBar(
        // title: Text(
        //   widget.title,
        //   style: MkTheme.of(context).body1.copyWith(color: Colors.white),
        // ),
        background: _buildTopBackground(),
      ),
    );
  }

  Widget _buildTopBackground() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(
          image: widget.image,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.15),
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.95),
                Colors.black
              ],
              begin: Alignment.topCenter,
              // end: Alignment.bottomCenter,
              end: Alignment(.0, 4.0),
            ),
          ),
        ),
      ],
    );
  }
}
