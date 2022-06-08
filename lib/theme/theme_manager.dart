import 'package:flutter/material.dart';
import 'package:phones_market/theme/ru_theme.dart';

import 'en_theme.dart';


class ThemeManager {
  final String locale;

  ThemeManager({required this.locale});

  ThemeData get getTheme {
    switch (locale) {
      case 'en':
        return EnTheme().getTheme;
      case 'ru':
        return RuTheme().getTheme;
      default:
        return EnTheme().getTheme;
    }
  }
}
