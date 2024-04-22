import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

/// [StatelessWidget] representing a row in the settings screen, displaying a setting name
/// with a clickable arrow icon on the right side.
///
/// #### Parameters:
/// - [settingName] : The name of the setting to be displayed.
/// - [onClick] : Callback function executed on row click.
class SettingsRow extends StatelessWidget {
  const SettingsRow(
      {super.key, required this.settingName, required this.onClick});

  final String settingName;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onClick: onClick,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              settingName,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontsWeight.semiBold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            SvgPicture.asset(
              UiConstants.rightIconAssetPath,
              height: 16.h,
              semanticsLabel: "Right Icon",
              colorFilter: const ColorFilter.mode(
                  AppColors.viewGrayVariation, BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }
}
