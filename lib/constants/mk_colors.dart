import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MkColors {
  MkColors._();
  static const _baseWhite = 0xFFFFFFFF;
  static const _baseBlack = 0xFF232323;
  static const MaterialColor white = const MaterialColor(
    _baseWhite,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFfafafa),
      200: const Color(0xFFf5f5f5),
      300: const Color(_baseWhite),
      400: const Color(0xFFdedede),
      500: const Color(0xFFc2c2c2),
      600: const Color(0xFF979797),
      700: const Color(0xFF818181),
      800: const Color(0xFF606060),
      900: const Color(0xFF3c3c3c),
    },
  );
  static const MaterialColor black = const MaterialColor(
    _baseBlack,
    const <int, Color>{
      50: const Color(0xFFfafafa),
      100: const Color(0xFFf5f5f5),
      200: const Color(0xFFefefef),
      300: const Color(0xFFe2e2e2),
      400: const Color(0xFF444444),
      500: const Color(0xFFa0a0a0),
      600: const Color(0xFF777777),
      700: const Color(0xFF636363),
      800: const Color(0xFF444444),
      900: const Color(_baseBlack),
    },
  );
  static const Color accent = const Color(_baseWhite);
  static const Color primary = const Color(_baseBlack);
  static const Color light_grey = const Color(0xFF9B9B9B);
}
