part of '../widgets.dart';

/// [StatelessWidget] for rendering a custom top bar with a back button on the left
/// or a skip button on the right.
///
/// #### Parameters:
/// - [onTap] : The callback function when the skip button is clicked.
/// - [showSkip] : The flag to determine whether to show the skip button (default is false).
class BackSkipTopBar extends StatelessWidget {
  final VoidCallback onTap;
  final bool showSkip;

  const BackSkipTopBar({required this.onTap, this.showSkip = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: UiConstants.authContentVPadding.h,
        left: UiConstants.authContentHPadding.w,
        right: UiConstants.authContentHPadding.w,
      ),

      /// Row to horizontally arrange back/skip button and skip button if applicable
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            showSkip ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          /// Display skip button if showSkip is true
          if (showSkip)
            ViewClickableText(
                key: Keys.userSelectionSkipKey,
                onTap: () => onTap(),
                text: AppLocalizations.of(context)!.skip,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.viewBlue,
                    fontWeight: FontsWeight.semiBold))

          /// Display back button if showSkip is false
          else
            BackIcon(onClick: () => onTap()),
        ],
      ),
    );
  }
}
