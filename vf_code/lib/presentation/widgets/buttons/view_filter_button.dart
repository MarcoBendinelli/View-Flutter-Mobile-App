part of '../widgets.dart';

/// A custom filter button widget designed for user interactions. It changes its background
/// and text color based on tap events, providing visual feedback to the user.
/// This is a [StatelessWidget] which state is managed by its ancestor.
///
/// Parameters:
/// - [textContent] : The text content displayed on the button.
/// - [isSelected] : The [bool] variable that indicates whether the button is selected or not.
/// - [isOpacityBehaviour] : The [bool] variable that indicates whether the button changes
///   opacity instead of color on click.
/// - [onClick] : A callback function executed when the button is pressed.
class ViewFilterButton extends StatelessWidget {
  final String textContent;
  final bool isSelected;
  final bool isOpacityBehaviour;
  final Function() onClick;

  const ViewFilterButton(
      {super.key,
      required this.textContent,
      required this.onClick,
      required this.isSelected,
      required this.isOpacityBehaviour});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isOpacityBehaviour
              ? AppColors.viewGrayBubbleButton
              : isSelected
                  ? AppColors.viewBlue
                  : AppColors.viewGrayBubbleButton,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
          child: Text(
            textContent,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontsWeight.semiBold,
                color: isOpacityBehaviour
                    ? isSelected
                        ? AppColors.viewAlmostBlack
                        : AppColors.viewGray
                    : isSelected
                        ? Colors.white
                        : AppColors.viewAlmostBlack),
          ),
        ),
      ),
    );
  }
}
