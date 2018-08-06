// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/constants/mk_fonts.dart';
import 'package:lfw_mobile/constants/mk_style.dart';

class MkBorderSide extends BorderSide {
  const MkBorderSide({
    Color color,
    BorderStyle style,
  }) : super(
          color: color ?? kBorderSideColor,
          style: style ?? BorderStyle.solid,
          width: 1.0,
        );
}

class MkStyle extends TextStyle {
  const MkStyle.mkFont(
    double size,
    FontWeight weight,
    Color color,
  ) : super(
          inherit: false,
          color: color,
          fontFamily: MkFonts.base,
          fontSize: size,
          fontWeight: weight,
          textBaseline: TextBaseline.alphabetic,
        );

  static FontWeight light = FontWeight.w200;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w600;
  static FontWeight semibold = FontWeight.w700;
  static FontWeight bold = FontWeight.w900;
}

TextStyle mkFont(double fontSize, Color color) =>
    TextStyle(fontSize: fontSize, color: color);

TextStyle mkFontSize(double fontSize) => TextStyle(fontSize: fontSize);

TextStyle mkFontColor(Color color) => TextStyle(color: color);

TextStyle mkFontLight(double fontSize, [Color color]) =>
    new MkStyle.mkFont(fontSize, MkStyle.light, color ?? kTextBaseColor);
TextStyle mkFontRegular(double fontSize, [Color color]) =>
    new MkStyle.mkFont(fontSize, MkStyle.regular, color ?? kTextBaseColor);
TextStyle mkFontMedium(double fontSize, [Color color]) =>
    new MkStyle.mkFont(fontSize, MkStyle.medium, color ?? kTextBaseColor);
TextStyle mkFontSemi(double fontSize, [Color color]) =>
    new MkStyle.mkFont(fontSize, MkStyle.semibold, color ?? kTextBaseColor);
TextStyle mkFontBold(double fontSize, [Color color]) =>
    new MkStyle.mkFont(fontSize, MkStyle.bold, color ?? kTextBaseColor);

/// The TextStyles and Colors used for titles, labels, and descriptions. This
/// InheritedWidget is shared by all of the routes and widgets created for
/// the Mk app.
class MkTheme extends InheritedWidget {
  MkTheme({Key key, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);

  Color get accentColor => MkColors.accent;
  Color get primaryColor => MkColors.primary;
  Color get borderSideColor => kBorderSideColor;
  Color get appBarBackgroundColor => scaffoldColor;

  final Color scaffoldColor = kBackgroundBaseColor;
  final Color scaffoldColorAlt = kTextBaseColor.shade100;
  final Color appBarColor = Colors.white;
  final Color textColor = kTextBaseColor.shade600;
  final Color textMutedColor = kTextBaseColor.shade500;

  // final Color scaffoldColor = Color(0xFF00251a);
  // final Color scaffoldColorAlt = Colors.blueGrey.shade700;
  // final Color appBarColor = Color(0xFF39796b);
  // final Color textColor = Color(0xFF39796b);

  TextStyle get appBarStyle => mkFontRegular(22.0, appBarColor);
  TextStyle get titleStyle => mkFontMedium(18.0, kTitleBaseColor);
  TextStyle get smallTextStyle => mkFontRegular(12.0, textColor);
  TextStyle get mediumTextStyle => mkFontRegular(13.0, textColor);
  TextStyle get textFieldStyle => mkFontMedium(14.0, MkColors.light_grey);
  TextStyle get textFieldLabelStyle => TextStyle(color: MkColors.light_grey);
  TextStyle get text14Style => mkFontRegular(14.0, textColor);
  TextStyle get text15Style => mkFontRegular(15.0, textColor);
  TextStyle get text16Style => mkFontRegular(16.0, textColor);
  TextStyle get text20Style => mkFontRegular(20.0, textColor);

  static MkTheme of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(MkTheme);

  @override
  bool updateShouldNotify(MkTheme oldWidget) => false;
}
