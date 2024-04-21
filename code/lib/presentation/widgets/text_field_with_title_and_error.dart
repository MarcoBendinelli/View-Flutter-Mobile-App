part of 'widgets.dart';

/// A widget that combines a text field with a title, error message, and optional trailing icon,
///
/// #### Parameters:
/// - [title] : The title text displayed above the text field.
/// - [label] : The label text displayed inside the text field when it is empty.
/// - [error] : The error message to be displayed, or null if there is no error.
/// - [trailingIcon] : The trailing icon widget displayed inside the text field.
/// - [trailingIconSize] : The trailing icon size.
/// - [keyboardType] : The keyboard type for the text field.
/// - [imeAction] : The Input Method Editor (IME) action for the keyboard.
/// - [textFieldFocusNode] : The focus node to obtain the keyboard focus and to handle keyboard events.
/// - [onAction] : The keyboard actions to perform when the IME action is triggered.
/// - [obscureText] : Whether to obscure the text in the field (e.g., for password input).
/// - [onValueChange] : The callback for handling changes in the text field value.
class TextFieldWithTitleAndError extends StatelessWidget {
  final String title;
  final String label;
  final String error;
  final Widget trailingIcon;
  final int trailingIconSize;
  final TextInputType keyboardType;
  final TextInputAction imeAction;
  final FocusNode? textFieldFocusNode;
  final Function() onAction;
  final bool obscureText;
  final Function(String) onValueChange;

  const TextFieldWithTitleAndError({
    super.key,
    required this.title,
    required this.label,
    required this.error,
    this.textFieldFocusNode,
    this.trailingIcon = const SizedBox(),
    this.trailingIconSize = 0,
    required this.keyboardType,
    this.imeAction = TextInputAction.none,
    required this.onAction,
    this.obscureText = false,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    /// Column to vertically arrange the title, text field, and error message
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title text
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),

        SizedBox(height: 8.h), // Add vertical spacing

        /// Text field
        TextField(
            onChanged: onValueChange,
            keyboardType: keyboardType,
            textInputAction: imeAction,
            onEditingComplete: onAction,
            focusNode: textFieldFocusNode,
            maxLines: 1,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedErrorBorder:
                    getBorder(Theme.of(context).colorScheme.error),
                focusedBorder: getBorder(AppColors.viewGrayBorder),
                border: getBorder(AppColors.viewGrayBorder),

                /// Display error message if present
                error: error.isNotEmpty
                    ? SizedBox(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            error,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Theme.of(context).colorScheme.error),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      )
                    : null,
                contentPadding: EdgeInsets.all(16.r),

                /// Label text and style
                labelText: label,
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.viewGrayLabel),

                /// Trailing icon
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 16.r),
                  child: trailingIcon,
                ),
                suffixIconConstraints: BoxConstraints(
                    maxHeight: (trailingIconSize + 16).r,
                    maxWidth: (trailingIconSize + 16).r)),
            obscureText: obscureText,
            cursorColor: Theme.of(context).colorScheme.inverseSurface,

            /// Style of the input text
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary)),
      ],
    );
  }
}

/// Text Field Border
getBorder(color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
    ),
    borderRadius: BorderRadius.circular(16.r),
  );
}
