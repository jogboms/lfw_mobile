import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lfw_mobile/constants/mk_icons.dart';
import 'package:lfw_mobile/constants/mk_images.dart';
import 'package:lfw_mobile/utils/mk_navigate.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';
import 'package:lfw_mobile/widgets/partials/mk_clear_button.dart';
import 'package:lfw_mobile/widgets/partials/mk_primary_button.dart';
import 'package:lfw_mobile/widgets/screens/events/events_page.dart';

class CollectionsPage extends StatefulWidget {
  @override
  _CollectionsPageState createState() => new _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  final images = <ImageProvider>[
    MkImages.img_1,
    MkImages.img_2,
    MkImages.img_3,
  ];

  final titles = <String>[
    "Collection",
    "Event",
    "Collection",
  ];

  final headers = <String>[
    "Arise Fashion",
    "The Lagos Fashion Week",
    "Pure London Exhibition"
  ];

  final counts = <String>[
    "129 items",
    "612 items",
    "244 items",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Swiper(
              itemBuilder: _slideBuilder,
              itemCount: images.length,
              autoplay: true,
              duration: 1500,
              autoplayDelay: 5000,
              pagination: SwiperPagination(
                margin: EdgeInsets.only(bottom: 36.0),
              ),
            ),
            SafeArea(
              bottom: false,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: kToolbarHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MkClearButton(
                        child: Icon(MkIcons.List___Alt),
                        onPressed: () {},
                      ),
                      MkClearButton(
                        child: Icon(MkIcons.Loupe),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _slideBuilder(BuildContext context, int index) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(
          image: images[index],
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(titles[index], style: mkFontRegular(12.0)),
              SizedBox(height: 4.0),
              LayoutBuilder(
                builder: (_, BoxConstraints constraints) {
                  return SizedBox(
                    width: constraints.maxWidth / 2,
                    child: Text(
                      headers[index],
                      style: mkFontBold(24.0).copyWith(height: 1.05),
                    ),
                  );
                },
              ),
              SizedBox(height: 16.0),
              Text(counts[index], style: mkFontRegular(14.0, Colors.grey)),
              SizedBox(height: 16.0),
              MkPrimaryButton(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("See More"),
                onPressed: () {
                  MkNavigate(context, EventsPage());
                },
              ),
              SizedBox(height: 64.0 * 2),
            ],
          ),
        ),
      ],
    );
  }
}
