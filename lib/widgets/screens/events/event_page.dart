import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_back_button.dart';
import 'package:glam/widgets/views/image_view.dart';

const kScrollBarHeight = 228.0;

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
          SliverToBoxAdapter(child: _buildBody()),
          SliverToBoxAdapter(child: _buildFooter()),
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
            SizedBox(
              height: kScrollBarHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  const _height = (kScrollBarHeight / 1.2) - 2.0;
                  const _width = _height / 1.3125;
                  return SizedBox(
                    width: _width,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: _height,
                            child: Material(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image(
                                image: widget.image,
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover,
                                // fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "Length Tent Dresstr ereyr",
                            style: bodyStyle.copyWith(
                              fontWeight: MkStyle.medium,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "N160",
                            style: bodyStyle.copyWith(
                              fontWeight: MkStyle.semibold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              "Designers",
              style: MkTheme.of(context).subhead1.copyWith(color: Colors.white),
            ),
            SizedBox(height: 24.0),
            Text(
              "Zara Nicols",
              style: bodyStyle,
            ),
            SizedBox(height: 8.0),
            Divider(color: Colors.white.withOpacity(.35)),
            SizedBox(height: 8.0),
            Text(
              "Mai Atafo",
              style: bodyStyle,
            ),
            SizedBox(height: 8.0),
            Divider(color: Colors.white.withOpacity(.35)),
            SizedBox(height: 8.0),
            Text(
              "Zara Nicols",
              style: bodyStyle,
            ),
            SizedBox(height: 8.0),
            Divider(color: Colors.white.withOpacity(.35)),
            SizedBox(height: 8.0),
            Text(
              "Zara Nicols",
              style: bodyStyle,
            ),
            SizedBox(height: 32.0),
          ],
        ),
      ),
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
                  child: Container(
                    width: 124.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(5.0),
                      child: new Ink.image(
                        image: MkImages.o4,
                        fit: BoxFit.cover,
                        child: new InkWell(
                          onTap: () {
                            Navigator.of(context).push<dynamic>(
                              fadeInRoute(
                                image: MkImages.o4,
                              ),
                            );
                          },
                          child: SizedBox(),
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
        background: Hero(
          tag: widget.tag,
          child: Stack(
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
          ),
        ),
      ),
    );
  }
}
