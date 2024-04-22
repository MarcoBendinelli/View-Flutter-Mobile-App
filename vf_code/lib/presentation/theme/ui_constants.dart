part of 'theme.dart';

/// Class containing constants related to UI elements, such as paddings.
class UiConstants {
  /// Paddings
  static const int authContentHPadding = 30;
  static const int authContentVPadding = 20;
  static const int authContentTopPadding = 30;
  static const int homeContentPadding = 20;
  static const int homeContentTopPadding = 30;

  /// Opacity
  static const maxOpacity = 1.0;
  static const minOpacity = 0.6;

  /// Assets
  static const String logoAssetPath = "assets/logo.svg";
  static const String googleAssetPath = "assets/icon_google.svg";
  static const String emailAssetPath = "assets/icon_email.svg";
  static const String backIconAssetPath = "assets/icon_arrow_left.svg";
  static const String rightIconAssetPath = "assets/icon_arrow_right.svg";
  static const String passIconHideAssetPath = "assets/icon_pass_hidden.svg";
  static const String passIconVisibleAssetPath = "assets/icon_pass_visible.svg";
  static const String messageAssetPath = "assets/icon_message.svg";
  static const String profileAssetPath = "assets/icon_profile.svg";
  static const String bookmarkAssetPath = "assets/icon_bookmark.svg";
  static const String bookmarkFilledAssetPath =
      "assets/icon_bookmark_filled.svg";
  static const String bookmarkFilledDarkAssetPath =
      "assets/icon_bookmark_filled_dark.svg";
  static const String bookmarkBlueAssetPath = "assets/icon_bookmark_blue.svg";
  static const String homeAssetPath = "assets/icon_home.svg";
  static const String homeFilledAssetPath = "assets/icon_home_filled.svg";
  static const String homeFilledDarkAssetPath = "assets/icon_home_filled_dark.svg";
  static const String searchAssetPath = "assets/icon_search.svg";
  static const String searchFilledAssetPath = "assets/icon_search_filled.svg";
  static const String searchFilledDarkAssetPath = "assets/icon_search_filled_dark.svg";
  static const String settingsAssetPath = "assets/icon_settings.svg";
  static const String settingsFilledAssetPath =
      "assets/icon_settings_filled.svg";
  static const String settingsFilledDarkAssetPath =
      "assets/icon_settings_filled_dark.svg";
  static const String addAssetPath = "assets/icon_add.svg";
  static const String documentAssetPath = "assets/icon_document.svg";
  static const String thumbImageAssetPath = "assets/icon_thumb_image.svg";

  /// Messages
  static const String defaultErrorMessage = "An error occurred";

  /// Get the asset of the icon used in the [LandingScreen]
  static List<String> get iconAssetPaths => [
        homeAssetPath,
        searchAssetPath,
        bookmarkAssetPath,
        settingsAssetPath,
      ];

  /// Get the asset of the filled icon used in the [LandingScreen]
  static List<String> get iconFilledAssetPaths => [
        homeFilledAssetPath,
        searchFilledAssetPath,
        bookmarkFilledAssetPath,
        settingsFilledAssetPath,
      ];

  /// Get the asset of the filled dark icon used in the [LandingScreen]
  static List<String> get iconFilledDarkAssetPaths => [
    homeFilledDarkAssetPath,
    searchFilledDarkAssetPath,
    bookmarkFilledDarkAssetPath,
    settingsFilledDarkAssetPath,
  ];
}
