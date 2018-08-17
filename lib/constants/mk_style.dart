import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_fonts.dart';

const Color kAccentColor = MkColors.accent;
const Color kPrimaryColor = MkColors.primary;

const MaterialColor kAccentSwatch = MkColors.white;
const MaterialColor kPrimarySwatch = MkColors.black;

final Color kHintColor = Colors.grey.shade500;
const Color kBorderSideColor = const Color(0x3A9E9E9E);
const MaterialColor kTextBaseColor = MkColors.black;
const MaterialColor kTitleBaseColor = MkColors.black;
const MaterialColor kBackgroundBaseColor = MkColors.white;

const BorderRadius kBorderRadius = const BorderRadius.all(Radius.circular(5.0));

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
  const MkStyle.mkFont({
    double fontSize,
    FontWeight fontWeight,
    Color color,
  }) : super(
          inherit: false,
          color: color ?? kTextBaseColor,
          fontFamily: MkFonts.base,
          fontSize: fontSize,
          fontWeight: fontWeight ?? MkStyle.regular,
          wordSpacing: -2.5,
          letterSpacing: -0.5,
          textBaseline: TextBaseline.alphabetic,
        );

  static const FontWeight light = FontWeight.w200;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w600;
  static const FontWeight semibold = FontWeight.w700;
  static const FontWeight bold = FontWeight.w900;
}

TextStyle mkFont(double fontSize, Color color) =>
    MkStyle.mkFont(fontSize: fontSize, color: color);

TextStyle mkFontSize(double fontSize) => MkStyle.mkFont(fontSize: fontSize);

TextStyle mkFontColor(Color color) => MkStyle.mkFont(color: color);

TextStyle mkFontLight(double fontSize, [Color color]) => new MkStyle.mkFont(
      fontSize: fontSize,
      fontWeight: MkStyle.light,
      color: color ?? kTextBaseColor,
    );
TextStyle mkFontRegular(double fontSize, [Color color]) => new MkStyle.mkFont(
      fontSize: fontSize,
      fontWeight: MkStyle.regular,
      color: color ?? kTextBaseColor,
    );
TextStyle mkFontMedium(double fontSize, [Color color]) => new MkStyle.mkFont(
      fontSize: fontSize,
      fontWeight: MkStyle.medium,
      color: color ?? kTextBaseColor,
    );
TextStyle mkFontSemi(double fontSize, [Color color]) => new MkStyle.mkFont(
      fontSize: fontSize,
      fontWeight: MkStyle.semibold,
      color: color ?? kTextBaseColor,
    );
TextStyle mkFontBold(double fontSize, [Color color]) => new MkStyle.mkFont(
      fontSize: fontSize,
      fontWeight: MkStyle.bold,
      color: color ?? kTextBaseColor,
    );
