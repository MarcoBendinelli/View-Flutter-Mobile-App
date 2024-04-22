part of '../widgets.dart';

/// The add button for the [ViewBottomNavBar] that responds to taps and vertical drags.
///
/// #### Parameters:
/// - [onClick] : The callback function to be executed when the item is clicked.
class ViewAddButton extends StatelessWidget {
  final VoidCallback onClick;

  const ViewAddButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onClick: onClick,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.viewBlue,
        ),
        padding: EdgeInsets.all(20.r), // Adjust the padding as needed
        child: SvgPicture.asset(
          UiConstants.addAssetPath,
          semanticsLabel: "Add Logo",
          height: 20.h,
        ),
      ),
    );
  }
}
