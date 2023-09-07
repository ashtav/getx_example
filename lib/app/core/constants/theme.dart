import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: false,
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Colors.white,
    elevation: .5,
    titleTextStyle: Gfont.fs20,
    iconTheme: const IconThemeData(color: Colors.black87, size: 20),
  ),
  iconTheme: const IconThemeData(color: Colors.black87, size: 20),
  textTheme: TextTheme(
    bodyLarge: gfont,
    bodyMedium: gfont,
    titleMedium: gfont,
    titleSmall: gfont,
  ),
);
