part of '../widgets.dart';

/// A customizable text button widget that changes appearance on user interaction.
///
/// This widget provides a text button that responds to tap and drag events,
/// changing its opacity on user interaction.
///
/// #### Parameters:
/// - [textContent] : The text content displayed on the button.
/// - [colorContainer] : The background color of the button.
/// - [widthBorder] : The width of the border around the button.
/// - [style] : The text style of the button.
/// - [sizeShape] : The border radius of the button.
/// - [enabled] : The button is currently enabled or disabled.
/// - [onClick] : The callback function executed when the button is clicked.
class ViewTextButton extends StatelessWidget {
  final String textContent;
  final Color colorContainer;
  final double widthBorder;
  final TextStyle style;
  final int sizeShape;
  final bool enabled;
  final VoidCallback onClick;

  const ViewTextButton(
      {super.key,
      required this.textContent,
      this.colorContainer = AppColors.viewBlue,
      this.widthBorder = 0,
      this.sizeShape = 16,
      required this.enabled,
      required this.onClick,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onClick: onClick,
      enabled: enabled,
      child: Container(
        height: 55.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: widthBorder,
            color: AppColors.viewBlue,
          ),
          borderRadius: BorderRadius.circular(sizeShape.r),
          color: colorContainer,
        ),
        child: Center(
          child: Text(
            textContent,
            style: style,
          ),
        ),
      ),
    );
  }
}
