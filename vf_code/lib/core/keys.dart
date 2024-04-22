import 'package:flutter/material.dart';

/// The [Keys] class contains static constants representing keys for UI elements in the app.
/// These keys are typically used for widget testing to uniquely identify and interact with specific widgets.
class Keys {
  // Auth Screen
  static const googleButtonKey = Key('authContent_Google_button');
  static const signUpButtonKey = Key('authContent_signUp_button');
  static const signInButtonKey = Key('authContent_signIn_button');

  // Sign Up Screen
  static const signUpEmailInputKey = Key('signUpForm_emailInput_textField');
  static const signUpPasswordInputKey =
      Key('signUpForm_passwordInput_textField');
  static const signUpConfirmedPasswordInputKey =
      Key('signUpForm_confirmedPasswordInput_textField');
  static const signUpFormButtonKey = Key('signUpForm_signUp_button');

  // First Selection Screen
  static topicKey(topicName) {
    return Key('topic_${topicName}_button');
  }

  static const topicSelectionContinueKey = Key('topic_continue_button');
  static const userSelectionSkipKey = Key('user_skip_button');

  // Sign In Screen
  static const signInEmailInputKey = Key('loginForm_emailInput_textField');
  static const signInPasswordInputKey =
      Key('loginForm_passwordInput_textField');
  static const signInForgotPasswordButtonKey =
      Key('loginForm_forgotPassword_button');
  static const signInFormButtonKey = Key('loginForm_signIn_button');

  // Forgot Password Screen
  static const forgotPasswordEmailInputKey =
      Key('forgotPassword_emailInput_textField');
  static const forgotPasswordResetButton = Key('forgotPassword_reset_button');

  // Home Screen
  static const homeLogoutButtonKey = Key('homePage_logout_iconButton');
  static const homeAvatarButtonKey = Key('home_avatar_button');

  // User Screen
  static postKey(postIndex) {
    return Key('post_${postIndex}_button');
  }

  // Navigation Bar
  static const homeNavBarButtonKey = Key('home_nav_bar_button');
  static const searchNavBarButtonKey = Key('search_nav_bar_button');
  static const bookmarksNavBarButtonKey = Key('bookmarks_nav_bar_button');
  static const settingsNavBarButtonKey = Key('settings_nav_bar_button');

  // Email Sent Screen
  static const emailSentBackButtonKey = Key('emailSent_back_button');

  // Add Post
  static const addPostButtonKey = Key('add_post_button');
  static const addPostTitleKey = Key('add_post_title_field');
  static const addPostSubtitleKey = Key('add_post_subtitle_field');
  static const addPostBodyKey = Key('add_post_body_field');
  static const addPostPublishNow = Key('add_post_publish_now_button');

  // Widgets
  static const backIconKey = Key('back_icon_button');
  static const logoutKey = Key('logout_text_button');
}
