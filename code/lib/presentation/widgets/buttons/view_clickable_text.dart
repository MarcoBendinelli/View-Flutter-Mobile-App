part of '../widgets.dart';

/// A clickable text widget with customizable styles.
///
/// This widget allows you to create text that responds to tap gestures.
/// It provides customizable text styles and handles opacity changes during interaction.
///
/// #### Parameters:
/// - [onTap] : The callback function that will be executed when the text is tapped.
/// - [text] : The text to be displayed by the widget.
/// - [style] : The style of the text.
/// - [isEnabled] : Whether the button is enabled or not.
class ViewClickableText extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final TextStyle style;
  final bool isEnabled;

  const ViewClickableText(
      {required this.onTap,
      required this.text,
      required this.style,
      this.isEnabled = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onClick: onTap,
      enabled: isEnabled,
      child: Text(text, style: style),
    );
  }
}
