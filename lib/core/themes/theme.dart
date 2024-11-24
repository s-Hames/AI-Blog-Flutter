import 'package:flutter/material.dart';
import 'app_pallete.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'SF',
    ),
  );
}
