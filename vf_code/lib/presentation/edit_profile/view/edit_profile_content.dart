part of 'edit_profile_screen.dart';

class EditProfileContent extends StatefulWidget {
  const EditProfileContent({super.key});

  @override
  State<EditProfileContent> createState() => _EditProfileContentState();
}

class _EditProfileContentState extends State<EditProfileContent> {
  XFile? _newUserImage;
  late String _newUsername;
  late String _newProfession;
  late List<String> _newTopics;

  @override
  void initState() {
    super.initState();
    _newUsername = context.read<AppBloc>().state.user.username;
    _newProfession = context.read<AppBloc>().state.user.profession;
    _newTopics = List.from(context.read<AppBloc>().state.user.topics);
  }

  @override
  Widget build(BuildContext context) {
    final username = context.select((AppBloc bloc) => bloc.state.user.username);
    final profession =
        context.select((AppBloc bloc) => bloc.state.user.profession);
    final photoUrl = context.select((AppBloc bloc) => bloc.state.user.photoUrl);

    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) async {
          if (state is FailureUpdateProfileState) {
            Utils.showErrorSnackBar(context, UiConstants.defaultErrorMessage);
          }
        },
        child: Padding(
            padding: EdgeInsets.only(
              top: UiConstants.homeContentTopPadding.h,
              left: 40.w,
              right: 40.w,
            ),
            child: Column(children: [
              /// Top Bar
              NameBackTopBar(
                  title: AppLocalizations.of(context)!.edit_profile,
                  showBackIcon: true),

              SizedBox(height: 50.h),

              Column(children: [
                /// Profile Image
                UpdateProfileImage(
                    currentProfileImage: photoUrl,
                    onTap: (image) {
                      _newUserImage = image;
                    }),

                SizedBox(height: 40.h),

                /// Personal Info...
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppLocalizations.of(context)!.personal_info,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontsWeight.semiBold)),
                ),

                SizedBox(height: 30.h),

                /// Username
                EditProfileTextField(
                    hintText: AppLocalizations.of(context)!.username,
                    oldText: username,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.viewGray),
                    textStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontsWeight.semiBold),
                    onChanged: (inputText) {
                      _newUsername = inputText;
                      context.read<RequiredFieldsCubit>().updateRequiredFields(
                          username: _newUsername, profession: _newProfession);
                    }),

                SizedBox(height: 20.h),

                /// Profession
                EditProfileTextField(
                    hintText: AppLocalizations.of(context)!.profession,
                    oldText: profession,
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.viewGray),
                    textStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontsWeight.semiBold),
                    onChanged: (inputText) {
                      _newProfession = inputText;
                      context.read<RequiredFieldsCubit>().updateRequiredFields(
                          username: _newUsername, profession: _newProfession);
                    }),

                SizedBox(height: 20.h),

                /// Topics
                BlocBuilder<TopicsCubit, List<String>>(
                    builder: (context, topics) {
                  return ScrollableMultiSelectionTopics(
                      topics: topics,
                      callback: (selectedTopic) {
                        setState(() {
                          _newTopics.contains(selectedTopic)
                              ? _newTopics.remove(selectedTopic)
                              : _newTopics.add(selectedTopic);
                        });
                      },
                      selectedTopics: _newTopics);
                }),

                SizedBox(height: 60.h),

                /// Save Button
                BlocBuilder<RequiredFieldsCubit, RequiredFieldsState>(
                  builder: (context, requiredFieldsState) {
                    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                      builder: (context, state) {
                        return state is LoadingUpdateProfileState
                            ? const ViewCircularProgress()
                            : ViewTextButton(
                                textContent: AppLocalizations.of(context)!.save,
                                enabled: requiredFieldsState
                                    is RequiredFieldsCompletedState,
                                onClick: () {
                                  context
                                      .read<UpdateProfileCubit>()
                                      .updateProfile(
                                          newUsername: _newUsername,
                                          newProfession: _newProfession,
                                          newUserImage: _newUserImage,
                                          newTopics: _newTopics);
                                  context.read<AppBloc>().add(const LoadUser());
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary));
                      },
                    );
                  },
                )
              ]),
            ])));
  }
}
