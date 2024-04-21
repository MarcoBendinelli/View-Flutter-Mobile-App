part of "settings_screen.dart";

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: UiConstants.homeContentTopPadding.h,
        left: UiConstants.homeContentPadding.w,
        right: UiConstants.homeContentPadding.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Bar
          NameBackTopBar(
              title: AppLocalizations.of(context)!.settings,
              showBackIcon: false),

          SizedBox(height: 40.h),

          SettingsRow(
              settingName: AppLocalizations.of(context)!.edit_profile,
              onClick: () =>
                  Navigator.of(context).push(EditProfileScreen.route())),

          Divider(height: 40.h),

          ViewClickableText(
            key: Keys.logoutKey,
            text: AppLocalizations.of(context)!.log_out,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontsWeight.semiBold, color: AppColors.viewRed),
            onTap: () {
              /// Make sure to reset the selection status
              context.read<AppBloc>().selectionPhaseEnded();

              /// Logout from the App
              context.read<AppBloc>().add(const RequestLogout());
            },
          ),
        ],
      ),
    );
  }
}
