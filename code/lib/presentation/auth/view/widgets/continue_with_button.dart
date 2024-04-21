import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

/// A custom button widget for rendering a "Continue with" button used
/// in the Auth phase to allow the users different type of authentication.
///
/// The button provides visual feedback such as opacity changes
/// when tapped or dragged. It also displays an icon and text associated with
/// the chosen sign-in option.
///
/// #### Parameters:
/// - [onTap] : The callback function that is executed when the button is tapped.
/// - [namePlatform] : The sign-in option for which the button is displayed.
class ContinueWithButton extends StatelessWidget {
  final VoidCallback onTap;
  final SignInOption namePlatform;

  const ContinueWithButton(
      {super.key, required this.onTap, required this.namePlatform});

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onClick: onTap,
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Theme.of(context).colorScheme.outline,
          ),
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Stack(
            children: [
              /// Svg image to display the icon
              Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  getIconAssetPath(namePlatform),
                  height: 22.h,
                  semanticsLabel: "${namePlatform.name} Logo",
                  colorFilter: namePlatform == SignInOption.email
                      ? ColorFilter.mode(
                          Theme.of(context).colorScheme.secondary,
                          BlendMode.srcIn)
                      : null,
                ),
              ),

              /// Text to display the button text
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${AppLocalizations.of(context)!.continue_with} ${namePlatform.name[0].toUpperCase()}${namePlatform.name.substring(1)}",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontsWeight.semiBold,
                      color: Theme.of(context).colorScheme.secondary),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns the asset path for the icon associated with the given sign-in option.
  String getIconAssetPath(SignInOption platform) {
    switch (platform) {
      case SignInOption.google:
        return UiConstants.googleAssetPath;
      case SignInOption.email:
        return UiConstants.emailAssetPath;
    }
  }
}
