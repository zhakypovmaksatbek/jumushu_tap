import 'package:flutter/material.dart';
import 'package:meenet/feature/constants/color_constants.dart';

class ProjectTheme {
  ThemeData get projectTheme => ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: const ColorScheme.light(
        primary: ColorConstants.black,
        onPrimary: ColorConstants.iconColor,
      ),
      scaffoldBackgroundColor: ColorConstants.white,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorConstants.white),
      iconTheme: const IconThemeData(color: ColorConstants.iconColor),
      // textTheme: const TextTheme(
      // titleMedium: TextStyle(
      //   color: ColorConstants.iconColor,
      //   fontWeight: FontWeight.w800,
      // ),
      // headlineLarge: TextStyle(
      //   color: ColorConstants.iconColor,
      //   fontWeight: FontWeight.w700,
      // ),
      // bodyLarge: TextStyle(
      //   color: ColorConstants.iconColor,
      //   fontWeight: FontWeight.w800,
      // ),
      // titleLarge: TextStyle(
      //   color: ColorConstants.iconColor,
      //   fontWeight: FontWeight.w800,
      // ),
      // displayLarge: TextStyle(
      //   color: ColorConstants.iconColor,
      //   fontWeight: FontWeight.w800,
      // ),
      // ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0, backgroundColor: ColorConstants.blue));
}
