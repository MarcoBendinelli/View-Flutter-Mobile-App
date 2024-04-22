part of '../widgets.dart';

/// A bottom navigation bar item for the [ViewBottomNavBar]
/// that responds to taps and vertical drags.
///
/// #### Parameters:
/// - [onClick] : The callback function to be executed when the item is clicked.
/// - [iconHeight] : The height of the icon.
/// - [iconAssetPath] : The asset path for the icon.
class ViewBottomNavBarItem extends StatelessWidget {
  final VoidCallback onClick;
  final int iconHeight;
  final String iconAssetPath;

  const ViewBottomNavBarItem(
      {super.key,
      required this.onClick,
      required this.iconHeight,
      required this.iconAssetPath});

  /// Handles tap up event and execute the callback.
  void _handleTapUp(TapUpDetails _) {
    onClick();
  }

  /// Handles vertical drag end event and execute the callback.
  void _handleVerticalDragEnd(DragEndDetails _) {
    onClick();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapUp: _handleTapUp,
        onVerticalDragEnd: _handleVerticalDragEnd,
        child: Container(
          height: double.infinity,
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(iconAssetPath,
                height: iconHeight.h,
                colorFilter: iconAssetPath.contains("filled") &&
                        !iconAssetPath.contains("dark")
                    ? ColorFilter.mode(Theme.of(context).colorScheme.secondary,
                        BlendMode.dstIn)
                    : null),
          ),
        ),
      ),
    );
  }
}
