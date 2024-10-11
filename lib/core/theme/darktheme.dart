// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade300,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade800, // Set your desired AppBar color here
    foregroundColor: Colors.white, // Set text and icon color for AppBar
  ),
);
