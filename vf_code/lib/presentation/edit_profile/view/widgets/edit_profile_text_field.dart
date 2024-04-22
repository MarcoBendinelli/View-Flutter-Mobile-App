import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/core/utils.dart';

/// Custom Text Field Widget to use inside the Edit Profile screen.
///
/// #### Parameters:
/// - [hintText] : The label text displayed inside the text field when it is empty.
/// - [oldText] : The old text to display.
/// - [labelStyle] : The style of the label.
/// - [textStyle] : The style of the input text.
/// - [onChanged] : The callback for handling changes in the text field value.
class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    required this.hintText,
    required this.oldText,
    required this.labelStyle,
    required this.textStyle,
    required this.onChanged,
  });

  final String hintText;
  final String oldText;
  final TextStyle labelStyle;
  final TextStyle textStyle;
  final StringCallback onChanged;

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController =
        TextEditingController(text: oldText);

    return Column(
      children: [
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            isDense: true,
            hintText: hintText,
            border: InputBorder.none,
            labelStyle: labelStyle,
          ),
          textCapitalization: TextCapitalization.sentences,
          textAlign: TextAlign.start,
          onChanged: onChanged,
          style: textStyle,
          cursorColor: Theme.of(context).colorScheme.inverseSurface,
        ),
        Divider(height: 20.h)
      ],
    );
  }
}
