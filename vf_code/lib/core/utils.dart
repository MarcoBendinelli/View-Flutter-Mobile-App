import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

typedef StringCallback = void Function(String selectedFilter);
typedef XFileCallback = void Function(XFile? image);

/// A utility class providing common methods for handling UI-related operations.
class Utils {
  /// Displays an error snackBar with the provided error message.
  ///
  /// The snackBar is attached to the given [BuildContext], hiding any existing snackBar
  /// before showing the new one.
  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }

  /// Estimates the read time of a text based on the average reading speed.
  ///
  /// The function assumes an average reading speed of 200 words per minute
  /// and calculates the estimated reading time in minutes. If the estimated
  /// time is less than 1 minute, it returns "Less than a minute." If the time
  /// is less than 60 minutes, it returns the time in minutes. Otherwise, it
  /// returns the time in hours.
  ///
  /// #### Parameters:
  ///   - [text] : The input text for which to estimate the read time.
  ///   - [context] : The context to get the texts from the arb file.
  ///
  /// Returns a string representing the estimated read time.
  static String estimateReadTime(
      {required String text, required BuildContext context}) {
    const wordsPerMinute = 200;

    // Calculate the number of words in the text
    // Text is split wherever one or more whitespace characters are found.
    final wordCount = text.noEmptyWordsCount;

    // Calculate the estimated reading time in minutes with the integer division operator.
    int minutes = wordCount ~/ wordsPerMinute;
    if (minutes == 0) {
      minutes = 1;
    }
    final hours = minutes ~/ 60;

    if (minutes < 60) {
      return '$minutes ${AppLocalizations.of(context)!.min}';
    } else if (hours == 1) {
      return '$minutes ${AppLocalizations.of(context)!.hour}';
    } else {
      return '$minutes ${AppLocalizations.of(context)!.hours}';
    }
  }

  /// Returns a difference string based on the provided [dateTime].
  ///
  /// The function calculates the time difference between the [dateTime] and the current time.
  /// It formats and returns a string such as "1 minute ago," "3 hours ago," "3 days ago," or "3 years ago."
  ///
  /// #### Parameters:
  ///  - [dateTime] : The input date time for which to calculate the time ago string.
  ///  - [context] : The context to get the texts from the arb file.
  static String calculateTimeAgoString(
      DateTime dateTime, BuildContext context) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    final appLocal = AppLocalizations.of(context)!;

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} ${difference.inSeconds == 1 ? appLocal.second : appLocal.seconds} ${appLocal.ago}';
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? appLocal.minute : appLocal.minutes} ${appLocal.ago}';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? appLocal.hour : appLocal.hours} ${appLocal.ago}';
    } else if (difference.inDays < 30) {
      final days = difference.inDays;
      return '$days ${days == 1 ? appLocal.day : appLocal.days} ${appLocal.ago}';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? appLocal.month : appLocal.months} ${appLocal.ago}';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? appLocal.year : appLocal.years} ${appLocal.ago}';
    }
  }

  /// Abbreviates a large number for concise display.
  ///
  /// #### Parameters:
  /// - [numberToAbbreviate] : The number to be abbreviated.
  /// Return The abbreviated string representation of the number.
  static String abbreviateNumber(int numberToAbbreviate) {
    if (numberToAbbreviate >= 1000000) {
      return "${(numberToAbbreviate / 1000000).round()}M";
    } else if (numberToAbbreviate >= 1000) {
      return "${(numberToAbbreviate / 1000).round()}K";
    } else {
      return "$numberToAbbreviate";
    }
  }
}

/// Extension to calculate the number of non empty words
/// inside a String
extension NoEmptyWordsCountExtension on String {
  int get noEmptyWordsCount {
    // Return the number of non empty words in the string
    return split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList()
        .length;
  }
}
