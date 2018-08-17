import 'package:flutter/material.dart';
import 'package:glam/constants/mk_routes.dart';
import 'package:glam/utils/mk_fade_in_route.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/partials/mk_touchable_opacity.dart';
import 'package:glam/widgets/screens/events/events_page.dart';

class MkBackHomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MkTouchableOpacity(
      child: Text(
        "Back to Events",
        style: MkTheme.of(context).bodyMedium,
      ),
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil<dynamic>(
          mkFadeInRoute(
            builder: (BuildContext context) => new EventsPage(),
          ),
          ModalRoute.withName(MkRoutes.events),
        );
      },
    );
  }
}
