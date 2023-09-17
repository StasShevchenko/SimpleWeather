import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

ThemeData appTheme() => ThemeData(
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primaryAccent,
        selectionHandleColor: AppColors.primaryAccent,
        selectionColor: AppColors.primaryAccent),
    focusColor: AppColors.primaryAccent,
    useMaterial3: true,
    visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
    colorScheme: const ColorScheme.highContrastLight(),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        color: AppColors.primary,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        )),
    inputDecorationTheme: appInputDecorationTheme(),
    textTheme: appTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle()));

InputDecorationTheme appInputDecorationTheme() => InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    outlineBorder: null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryAccent),
        borderRadius: BorderRadius.circular(12)),
    labelStyle: TextStyle(color: AppColors.primaryAccent),
    errorStyle: const TextStyle(color: Colors.red),
    fillColor: Colors.white,
    filled: true);

TextTheme appTextTheme() => TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.primaryAccent,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(color: AppColors.primaryAccent),
    titleLarge: TextStyle(color: AppColors.primaryAccent, fontSize: 28),
    titleMedium: TextStyle(
        color: AppColors.primaryAccent,
        fontSize: 24,
        fontWeight: FontWeight.w700));

ButtonStyle elevatedButtonStyle() => ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryAccent,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
