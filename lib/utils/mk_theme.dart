// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:glam/constants/mk_colors.dart';
import 'package:glam/constants/mk_style.dart';

/// The TextStyles and Colors used for titles, labels, and descriptions. This
/// InheritedWidget is shared by all of the routes and widgets created for
/// the Mk app.
class MkTheme extends InheritedWidget {
  const MkTheme({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  TextStyle get small => _text12Style;
  TextStyle get body1 => _text13Style;
  TextStyle get body2 => body1.copyWith(height: 1.5);
  TextStyle get body3 => _text14Style;
  TextStyle get bodyMedium => body1.copyWith(fontWeight: MkStyle.medium);
  TextStyle get bodyHint => body1.copyWith(color: Colors.grey);
  TextStyle get button => _text14MediumStyle;
  TextStyle get title => _header18Style;
  TextStyle get subhead1 => _text15MediumStyle;
  TextStyle get subhead1Bold => _text15BoldStyle;
  TextStyle get subhead1Light => _text15LightStyle;
  TextStyle get subhead2 => _text14Style;
  TextStyle get subhead3 => _text16Style;
  TextStyle get headline => _header20Style;

  TextStyle get display1 => _text20Style;
  TextStyle get display2 => _text24Style;
  TextStyle get display2Bold => _header24BoldStyle;
  TextStyle get display3 => _header28Style;
  TextStyle get display4 => _text32Style;
  TextStyle get display4Bold => _header32Style;

  TextStyle get textfield => body1.copyWith(
        color: MkColors.light_grey.withOpacity(.8),
      );
  TextStyle get textfieldLarge => subhead3.copyWith(
        color: MkColors.light_grey.withOpacity(.8),
      );

  TextStyle get _header18Style => mkFontMedium(18.0);
  TextStyle get _header20Style => mkFontMedium(20.0);
  TextStyle get _header24BoldStyle => mkFontBold(24.0).copyWith(height: 1.05);
  TextStyle get _header28Style => mkFontMedium(28.0);
  TextStyle get _header32Style => mkFontMedium(32.0);

  TextStyle get _text12Style => mkFontRegular(12.0);
  TextStyle get _text13Style => mkFontRegular(13.0);
  TextStyle get _text14Style => mkFontRegular(14.0);
  TextStyle get _text14MediumStyle => mkFontMedium(14.0);
  // TextStyle get _text15Style => mkFontRegular(15.0);
  TextStyle get _text15BoldStyle => mkFontSemi(15.0);
  TextStyle get _text15LightStyle => mkFontLight(15.0);
  TextStyle get _text15MediumStyle => mkFontMedium(15.0);
  TextStyle get _text16Style => mkFontRegular(16.0);
  // TextStyle get _text16MediumStyle => mkFontMedium(16.0);
  // TextStyle get _text18Style => mkFontRegular(18.0);
  TextStyle get _text20Style => mkFontRegular(20.0);
  TextStyle get _text24Style => mkFontRegular(24.0);
  TextStyle get _text32Style => mkFontRegular(32.0);

  static MkTheme of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(MkTheme);

  @override
  bool updateShouldNotify(MkTheme oldWidget) => false;
}
