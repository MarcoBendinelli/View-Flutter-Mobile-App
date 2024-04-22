import 'package:flutter/material.dart';
import 'package:view_app/core/utils.dart';

/// Custom Text Field Widget to use inside the Add Post screen.
///
/// #### Parameters:
/// - [hintText] : The label text displayed inside the text field when it is empty.
/// - [labelStyle] : The style of the label.
/// - [textStyle] : The style of the input text.
/// - [onChanged] : The callback for handling changes in the text field value.
/// - [keyboardType] : The keyboard type for the text field.
/// - [imeAction] : The Input Method Editor (IME) action for the keyboard.
/// - [onAction] : The keyboard actions to perform when the IME action is triggered.
/// - [textFieldFocusNode] : The focus node to obtain the keyboard focus and to handle keyboard events.
class AddPostTextField extends StatelessWidget {
  const AddPostTextField({
    super.key,
    required this.hintText,
    required this.labelStyle,
    required this.textStyle,
    required this.onChanged,
    this.keyboardType,
    required this.imeAction,
    required this.onAction,
    this.textFieldFocusNode,
  });

  final String hintText;
  final TextStyle labelStyle;
  final TextStyle textStyle;
  final StringCallback onChanged;
  final TextInputType? keyboardType;
  final TextInputAction imeAction;
  final Function() onAction;
  final FocusNode? textFieldFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        isDense: true,
        hintText: hintText,
        border: InputBorder.none,
        labelStyle: labelStyle,
      ),
      textCapitalization: TextCapitalization.sentences,
      textInputAction: imeAction,
      onEditingComplete: onAction,
      keyboardType: keyboardType,
      focusNode: textFieldFocusNode,
      maxLines: null,
      textAlign: TextAlign.start,
      onChanged: onChanged,
      style: textStyle,
      cursorColor: Theme.of(context).colorScheme.inverseSurface,
    );
  }
}
