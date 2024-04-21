part of 'theme.dart';

/// Defines a set of text styles for various typography elements in the app.
final viewTextTheme = TextTheme(
  // Title size (all in bold)

  displayLarge: TextStyle(
      fontSize: 30.sp,
      fontFamily: openSans,
      color: AppColors.viewAlmostBlack,
      fontWeight: FontsWeight.bold),
  displayMedium: TextStyle(
      fontSize: 28.sp,
      fontFamily: openSans,
      color: AppColors.viewAlmostBlack,
      fontWeight: FontsWeight.bold),
  displaySmall: TextStyle(
      fontSize: 24.sp,
      fontFamily: openSans,
      color: AppColors.viewAlmostBlack,
      fontWeight: FontsWeight.bold),
  headlineMedium: TextStyle(
      fontSize: 22.sp,
      fontFamily: openSans,
      color: AppColors.viewAlmostBlack,
      fontWeight: FontsWeight.bold),
  headlineLarge: TextStyle(
      fontSize: 18.sp,
      fontFamily: openSans,
      color: AppColors.viewAlmostBlack,
      fontWeight: FontsWeight.bold),
  headlineSmall: TextStyle(
      fontSize: 16.sp,
      fontFamily: openSans,
      color: AppColors.viewAlmostBlack,
      fontWeight: FontsWeight.bold),
  titleLarge: TextStyle(
      fontSize: 14.sp,
      fontFamily: openSans,
      color: AppColors.viewAlmostBlack,
      fontWeight: FontsWeight.bold),

  // All the gray, body and other texts

  titleMedium: TextStyle(
    fontSize: 16.sp,
    fontFamily: openSans,
    color: AppColors.viewGray,
  ),
  titleSmall: TextStyle(
    fontSize: 14.sp,
    fontFamily: openSans,
    color: AppColors.viewGray,
  ),
  bodyLarge: TextStyle(
    fontSize: 12.sp,
    fontFamily: openSans,
    color: AppColors.viewGray,
  ),

  // Text button size

  labelLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: openSans,
      color: AppColors.viewAlmostBlack,
      fontWeight: FontsWeight.bold),
  labelMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: openSans,
      color: AppColors.viewAlmostBlack,
      fontWeight: FontsWeight.bold),

  // Error message

  labelSmall: TextStyle(
      fontSize: 14.sp,
      fontFamily: openSans,
      color: AppColors.viewAlmostBlack,
      fontWeight: FontsWeight.medium),
);

/// The font family name for OpenSans.
const String openSans = "OpenSans";

/// The font family name for Source Sans 3 (Pro).
const String sourceSans3 = "sourceSans3";

/// The font family name for Roboto.
const String roboto = "Roboto";

/// Defines various font weights for text styles.
class FontsWeight {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}
