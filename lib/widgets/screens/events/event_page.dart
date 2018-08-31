import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_icons.dart';
import 'package:glam/constants/mk_images.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_back_button.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';
import 'package:glam/widgets/screens/events/ui/event_footer.dart';
import 'package:glam/widgets/views/photo_reel_grid.dart';
import 'package:share/share.dart';

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
  final ScrollController _scrollController = new ScrollController();
  bool isAtTop = false;

  void _updateScrollPosition() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.offset) {
      setState(() => isAtTop = true);
    } else if (8.0 < _scrollController.offset) {
      setState(() => isAtTop = false);
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_updateScrollPosition);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollPosition);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: MkColors.black.shade900,
      body: new NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: _buildAppBar(),
            ),
          ];
        },
        body: new Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: <Widget>[
                new SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    _buildBody(),
                    new EventFooter(),
                  ]),
                ),
              ],
            );
          },
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
          SizedBox(height: 16.0),
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
          new PhotoReelGrid(
            images: <ImageProvider>[
              MkImages.o4,
              MkImages.o2,
              MkImages.o3,
              MkImages.o1,
              MkImages.o4,
            ],
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
              Text("Share Event", style: MkTheme.of(context).bodyMedium),
              Expanded(child: SizedBox()),
              MkTouchableOpacity(
                child: Icon(MkIcons.Share___3, size: 18.0),
                onPressed: () {
                  final RenderBox box = context.findRenderObject();
                  Share.plainText(
                    title: "Title",
                    text: "This is a text",
                  ).share(
                    sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size,
                  );
                },
              ),
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
      expandedHeight: (MediaQuery.of(context).size.height) / 1.28,
      leading: MkBackButton(color: Colors.white),
      pinned: true,
      centerTitle: false,
      title: isAtTop
          ? Text(
              widget.title,
              style: MkTheme.of(context).subhead1.copyWith(color: Colors.white),
            )
          : null,
      flexibleSpace: new FlexibleSpaceBar(
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
