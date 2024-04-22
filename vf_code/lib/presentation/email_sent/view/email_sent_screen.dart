import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:view_app/core/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/core/keys.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

/// The [EmailSentScreen] widget represents the screen
/// for showing the user that the email was correctly sent
class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key});

  static MaterialPageRoute<void> route() =>
      viewRoute(const EmailSentScreen(), Constants.emailSentScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
            top: 110.h,
            left: UiConstants.authContentHPadding.w,
            right: UiConstants.authContentHPadding.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Message Sent image
            Container(
              width: 100.r,
              height: 100.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.viewBlue,
              ),
              child: Center(
                child: SvgPicture.asset(
                  UiConstants.messageAssetPath,
                  semanticsLabel: "Message Icon",
                  height: 48.r,
                  width: 48.r,
                ),
              ),
            ),

            SizedBox(height: 70.h),

            /// Email Sent message
            Text(
              AppLocalizations.of(context)!.email_sent,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),

            SizedBox(height: 16.h),

            /// Email Sent body
            Text(AppLocalizations.of(context)!.email_sent_body,
                style: Theme.of(context).textTheme.titleMedium!,
                textAlign: TextAlign.center),

            SizedBox(height: 30.h),

            /// Back to login screen button
            ViewTextButton(
              key: Keys.emailSentBackButtonKey,
              colorContainer: Theme.of(context).colorScheme.tertiary,
              textContent: AppLocalizations.of(context)!.back_to_login,
              enabled: true,
              widthBorder: 1,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.viewBlue, fontWeight: FontsWeight.medium),
              onClick: () {
                Navigator.of(context).popUntil(
                    (route) => route.settings.name == Constants.signInScreen);
              },
            )
          ],
        ),
      )),
    );
  }
}
