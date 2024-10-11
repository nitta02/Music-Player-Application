// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    inversePrimary: Colors.grey.shade900,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade500, // Set your desired AppBar color here
    foregroundColor: Colors.white, // Set text and icon color for AppBar
  ),
);
