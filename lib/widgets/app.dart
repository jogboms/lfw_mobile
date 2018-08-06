import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/constants/mk_fonts.dart';
import 'package:lfw_mobile/constants/mk_routes.dart';
import 'package:lfw_mobile/constants/mk_strings.dart';
import 'package:lfw_mobile/constants/mk_style.dart';
import 'package:lfw_mobile/utils/mk_navigate.dart';
import 'package:lfw_mobile/utils/mk_theme.dart';
import 'package:lfw_mobile/widgets/screens/start/start_page.dart';

class App extends StatelessWidget {
  App() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MkTheme(
      child: new MaterialApp(
        title: MkStrings.appName,
        theme: new ThemeData(
          accentColor: kAccentColor,
          primarySwatch: kPrimarySwatch,
          scaffoldBackgroundColor: kAccentColor,
          primaryColor: kPrimaryColor,
          primaryIconTheme: theme.iconTheme.copyWith(
            color: kPrimarySwatch,
          ),
          textTheme: theme.textTheme.copyWith(
            button: theme.textTheme.button.merge(
              mkFontMedium(16.0),
            ),
          ),
          splashColor: Colors.transparent,
          buttonTheme: theme.buttonTheme.copyWith(
            height: 48.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          canvasColor: kAccentColor,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimarySwatch, width: 2.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: MkColors.light_grey.withOpacity(.3),
              ),
            ),
            contentPadding: EdgeInsets.only(top: 13.0),
            hintStyle: mkFont(
              16.0,
              MkColors.light_grey.withOpacity(.8),
            ),
          ),
          cursorColor: kPrimaryColor,
          fontFamily: MkFonts.base,
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
