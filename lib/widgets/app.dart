import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/constants/mk_fonts.dart';
import 'package:lfw_mobile/utils/mk_navigate.dart';
import 'package:lfw_mobile/constants/mk_routes.dart';
import 'package:lfw_mobile/constants/mk_strings.dart';
import 'package:lfw_mobile/constants/mk_theme.dart';
import 'package:lfw_mobile/widgets/screens/start/start_page.dart';

class App extends StatelessWidget {
  App() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MkTheme(
      child: new MaterialApp(
        title: MkStrings.appName,
        theme: new ThemeData(
          accentColor: kAccentColor,
          primarySwatch: kPrimarySwatch,
          fontFamily: MkFonts.poppins,
          hintColor: MkColors.light_grey,
        ),
        onGenerateRoute: (RouteSettings settings) {
          return new MkNavigateRoute<dynamic>(
            builder: (_) => StartPage(),
            settings: settings.copyWith(name: MkRoutes.start),
          );
        },
      ),
    );
  }
}
