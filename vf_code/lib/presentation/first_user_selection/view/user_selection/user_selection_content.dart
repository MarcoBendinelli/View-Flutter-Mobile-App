part of "user_selection_screen.dart";

class UserSelectionContent extends StatelessWidget {
  const UserSelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TopicsUsersBloc, TopicsUsersState>(
          listener: (context, state) {
            if (state.status == TopicsUsersStatus.failure) {
              Utils.showErrorSnackBar(context, UiConstants.defaultErrorMessage);
            }
          },
        ),
        BlocListener<FirstSelectionCubit, FirstSelectionState>(
          listener: (context, state) {
            if (state.status == FirstSelectionStatus.failure) {
              Utils.showErrorSnackBar(context, UiConstants.defaultErrorMessage);
            }
          },
        ),
      ],
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        /// Top Bar
        BackSkipTopBar(
            onTap: () {
              /// The selection phase is over
              context.read<AppBloc>().selectionPhaseEnded();

              /// Manually change the [AppStatus] to authenticated
              context.read<AppBloc>().add(const LoadUser());

              /// Pop to trigger the FlowBuilder
              Navigator.of(context).pop();
            },
            showSkip: true),
        Padding(
            padding: EdgeInsets.only(
                left: UiConstants.authContentHPadding.w,
                right: UiConstants.authContentHPadding.w,
                top: 30.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              /// Title
              Text(
                AppLocalizations.of(context)!.follow_contributors,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),

              SizedBox(height: 8.h),

              /// Body
              Text(AppLocalizations.of(context)!.follow_contributors_body,
                  style: Theme.of(context).textTheme.titleMedium),

              SizedBox(height: 30.h),

              SizedBox(
                height: 500.h,
                child: BlocBuilder<TopicsUsersBloc, TopicsUsersState>(
                  builder: (context, state) {
                    if (state.status == TopicsUsersStatus.initial) {
                      return const ViewCircularProgress();
                    } else if (state.status == TopicsUsersStatus.success) {
                      if (state.users!.isEmpty) {
                        return Center(
                          heightFactor: 20.h,
                          child: Text(
                            AppLocalizations.of(context)!.no_user,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: state.users!.length,
                            itemBuilder: (context, index) {
                              final user = state.users![index];
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        state.users!.last == user ? 0 : 20.h),
                                child: Contributor(
                                    id: user.id,
                                    name: user.username,
                                    photoUrl: user.photoUrl,
                                    profession: user.profession,
                                    onClick: () => context
                                        .read<FirstSelectionCubit>()
                                        .selectUser(userId: user.id)),
                              );
                            });
                      }
                    } else {
                      return Text(
                        AppLocalizations.of(context)!.failed_fetch_users,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      );
                    }
                  },
                ),
              ),
            ])),
      ]),
    );
  }
}

/// Widget for displaying contributor information and follow button.
class Contributor extends StatelessWidget {
  final String id;
  final String name;
  final String photoUrl;
  final String profession;
  final VoidCallback onClick;

  const Contributor({
    super.key,
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.profession,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// User information
        Expanded(
          child: ViewContributor(
            name: name,
            nameTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontsWeight.semiBold,
                overflow: TextOverflow.ellipsis),
            bodyContributor: profession,
            professionTextStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(overflow: TextOverflow.ellipsis),
            photoUrl: photoUrl,
            avatarSize: 28,
            spaceBetweenAvatarAndText: 16,
            profileIconSize: 22,
            isEnabled: false,
            onUserAvatarClick: () {},
          ),
        ),

        SizedBox(width: 8.w),

        /// Follow the contributor button
        BlocBuilder<FirstSelectionCubit, FirstSelectionState>(
          builder: (context, state) {
            return FollowButton(
              widthButton: 80,
              heightButton: 40,
              enabled: state.selectedUsersIds.contains(id),
              widthBorder: 1,
              sizeShape: 12,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.viewBlue, fontWeight: FontsWeight.regular),
              onClick: onClick,
            );
          },
        )
      ],
    );
  }
}
