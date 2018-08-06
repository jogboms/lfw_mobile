import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/constants/mk_images.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';

const kScrollBarHeight = 240.0;

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
              style: mkFontMedium(16.0, Colors.white),
            ),
            SizedBox(height: 24.0),
            SizedBox(
              height: kScrollBarHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                    // alignment: Alignment.centerLeft,
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: kScrollBarHeight / 2,
                            child: Material(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image(
                                image: widget.image,
                                alignment: Alignment.topCenter,
                                // fit: BoxFit.cover,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Length Tent Dress",
                            style: mkFontMedium(14.0, Colors.white),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "N160",
                            style: mkFontBold(14.0, Colors.white),
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
              style: mkFontMedium(16.0, Colors.white),
            ),
            SizedBox(height: 24.0),
            Text(
              "Zara Nicols",
              style: mkFontRegular(16.0, Colors.white),
            ),
            SizedBox(height: 8.0),
            Divider(color: Colors.white.withOpacity(.35)),
            SizedBox(height: 8.0),
            Text(
              "Mai Atafo",
              style: mkFontRegular(16.0, Colors.white),
            ),
            SizedBox(height: 8.0),
            Divider(color: Colors.white.withOpacity(.35)),
            SizedBox(height: 8.0),
            Text(
              "Zara Nicols",
              style: mkFontRegular(16.0, Colors.white),
            ),
            SizedBox(height: 8.0),
            Divider(color: Colors.white.withOpacity(.35)),
            SizedBox(height: 8.0),
            Text(
              "Zara Nicols",
              style: mkFontRegular(16.0, Colors.white),
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
            style: mkFontSize(24.0),
          ),
          SizedBox(height: 16.0),
          Text(
            "November 2018",
            style: mkFont(14.0, MkColors.black.shade700),
          ),
          SizedBox(height: 24.0),
          Text(
            "The most common alloys added to gold to produce white gold are nickel, palladium and silver. Most white gold jewelry is also given an electroplated rhodium coating to intensify brightness.",
            style: mkFontSize(16.0),
          ),
          SizedBox(height: 24.0),
          Text(
            "If you are an infrequent traveler you may need some tips to keep the wife. ",
            style: mkFontSize(16.0),
          ),
          SizedBox(height: 24.0),
          SizedBox(
            height: 220.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(
                      image: MkImages.o2,
                      alignment: Alignment.topCenter,
                      // fit: BoxFit.cover,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 24.0),
          Text(
            "Happy while you are jet setting around the globe many individuals.",
            style: mkFontSize(16.0),
          ),
          SizedBox(height: 32.0),
          Text(
            "fashion, collection, magazine",
            style: mkFont(14.0, Colors.grey),
          ),
          SizedBox(height: 32.0),
          Divider(),
          SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Text("Share With", style: mkFontMedium(14.0)),
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
      leading: BackButton(color: Colors.white),
      pinned: true,
      flexibleSpace: Hero(
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
    );
  }
}
