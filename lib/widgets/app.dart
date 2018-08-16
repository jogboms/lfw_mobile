import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_fonts.dart';
import 'package:glam/constants/mk_routes.dart';
import 'package:glam/constants/mk_strings.dart';
import 'package:glam/constants/mk_style.dart';
import 'package:glam/utils/mk_navigate.dart';
import 'package:glam/utils/mk_theme.dart';
import 'package:glam/widgets/screens/start/start_page.dart';

class App extends StatelessWidget {
  App() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MkTheme(
      child: Builder(
        builder: (BuildContext context) {
          final theme = Theme.of(context);

          return new MaterialApp(
            title: MkStrings.appName,
            color: kPrimarySwatch.shade900,
            theme: new ThemeData(
              accentColor: kAccentColor,
              primarySwatch: kPrimarySwatch,
              scaffoldBackgroundColor: kAccentColor,
              primaryColor: kPrimaryColor,
              primaryIconTheme: theme.primaryIconTheme.copyWith(
                color: kPrimarySwatch,
              ),
              textTheme: theme.textTheme.copyWith(
                body1: theme.textTheme.body1.merge(
                  MkTheme.of(context).body1,
                ),
                button: theme.textTheme.button.merge(
                  MkTheme.of(context).button,
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
                hintStyle: MkTheme.of(context).textfield,
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
          );
        },
      ),
    );
  }
}
