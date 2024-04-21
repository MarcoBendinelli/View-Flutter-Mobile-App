part of '../widgets.dart';

/// Follow button used to follow a new [ViewUser].
///
/// #### Parameters
///
/// - [widthBorder] : The width of the button border.
/// - [widthButton] : The width of the button.
/// - [heightButton] : The height of the button.
/// - [style] : The text style of the button label.
/// - [sizeShape] : The size of the button's border radius, determining its shape.
/// - [enabled] : A flag indicating whether the button is enabled or not.
/// - [onClick] : Callback function to be executed when the button is tapped.
class FollowButton extends StatelessWidget {
  final double widthBorder;
  final int widthButton;
  final int heightButton;
  final TextStyle style;
  final int sizeShape;
  final bool enabled;
  final VoidCallback onClick;

  const FollowButton(
      {super.key,
      required this.widthBorder,
      required this.style,
      required this.sizeShape,
      required this.enabled,
      required this.onClick,
      required this.widthButton,
      required this.heightButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: heightButton.h,
        width: widthButton.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: widthBorder,
            color: AppColors.viewBlue,
          ),
          borderRadius: BorderRadius.circular(sizeShape.r),
          color: enabled ? AppColors.viewBlue : Colors.white,
        ),
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.follow,
            style: style.copyWith(color: enabled ? Colors.white : style.color!),
          ),
        ),
      ),
    );
  }
}
