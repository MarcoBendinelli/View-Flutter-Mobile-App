library view_theme;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/presentation/landing/landing_screen.dart';

part 'colors.dart';

part 'ui_constants.dart';

part 'text_type.dart';

/// App Light Theme.
final viewLightTheme = ThemeData.light().copyWith(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        enableFeedback: false,
        elevation: 0),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    colorScheme: const ColorScheme.light(
        primary: AppColors.viewBlue,
        secondary: AppColors.viewAlmostBlack,
        tertiary: Colors.white,
        outline: AppColors.viewGrayBorder,
        outlineVariant: AppColors.viewLightGrayBorder,
        secondaryContainer: AppColors.viewLightGrayVariantBorder,
        background: Colors.white,
        inverseSurface: Colors.black,
        error: AppColors.viewRed));

/// App Dark Theme.
final viewDarkTheme = ThemeData.dark().copyWith(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        enableFeedback: false,
        elevation: 0),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    colorScheme: const ColorScheme.dark(
        primary: AppColors.viewBlue,
        secondary: Colors.white,
        tertiary: AppColors.viewAlmostBlack,
        outline: AppColors.viewGrayBorder,
        outlineVariant: AppColors.viewLightGrayBorder,
        secondaryContainer: AppColors.viewLightGrayVariantBorder,
        background: Colors.black,
        inverseSurface: Colors.white,
        error: AppColors.viewRed));
