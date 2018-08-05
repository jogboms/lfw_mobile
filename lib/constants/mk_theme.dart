// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lfw_mobile/constants/mk_colors.dart';
import 'package:lfw_mobile/constants/mk_fonts.dart';

const Color kAccentColor = MkColors.accent;
const Color kPrimaryColor = MkColors.primary;

const MaterialColor kAccentSwatch = MkColors.white;
const MaterialColor kPrimarySwatch = MkColors.black;

final Color kHintColor = Colors.grey.shade500;
const Color kBorderSideColor = const Color(0x3A9E9E9E);
const MaterialColor kTextBaseColor = MkColors.black;
const MaterialColor kTitleBaseColor = MkColors.black;
const MaterialColor kBackgroundBaseColor = MkColors.white;

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
  const MkStyle.poppins(double size, FontWeight weight, Color color)
      : super(
          inherit: false,
          color: color,
          fontFamily: MkFonts.poppins,
          fontSize: size,
          fontWeight: weight,
          textBaseline: TextBaseline.alphabetic,
        );
}

TextStyle mkFont(double fontSize, Color color) =>
    TextStyle(fontSize: fontSize, color: color);

TextStyle mkFontSize(double fontSize) => TextStyle(fontSize: fontSize);

TextStyle mkFontColor(Color color) => TextStyle(color: color);

TextStyle poppinsThin(double fontSize, [Color color]) =>
    new MkStyle.poppins(fontSize, FontWeight.w100, color ?? kTextBaseColor);
TextStyle poppinsLight(double fontSize, [Color color]) =>
    new MkStyle.poppins(fontSize, FontWeight.w300, color ?? kTextBaseColor);
TextStyle poppinsRegular(double fontSize, [Color color]) =>
    new MkStyle.poppins(fontSize, FontWeight.w400, color ?? kTextBaseColor);
TextStyle poppinsMedium(double fontSize, [Color color]) =>
    new MkStyle.poppins(fontSize, FontWeight.w500, color ?? kTextBaseColor);
TextStyle poppinsBold(double fontSize, [Color color]) =>
    new MkStyle.poppins(fontSize, FontWeight.w700, color ?? kTextBaseColor);

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

  TextStyle get appBarStyle => poppinsRegular(22.0, appBarColor);
  TextStyle get titleStyle => poppinsMedium(18.0, kTitleBaseColor);
  TextStyle get smallTextStyle => poppinsRegular(12.0, textColor);
  TextStyle get mediumTextStyle => poppinsRegular(13.0, textColor);
  TextStyle get textFieldStyle => poppinsMedium(14.0, MkColors.light_grey);
  TextStyle get textFieldLabelStyle => TextStyle(color: MkColors.light_grey);
  TextStyle get text14Style => poppinsRegular(14.0, textColor);
  TextStyle get text15Style => poppinsRegular(15.0, textColor);
  TextStyle get text16Style => poppinsRegular(16.0, textColor);
  TextStyle get text20Style => poppinsRegular(20.0, textColor);

  static MkTheme of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(MkTheme);

  @override
  bool updateShouldNotify(MkTheme oldWidget) => false;
}
