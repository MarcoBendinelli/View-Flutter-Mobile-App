part of 'post_screen.dart';

/// [StatelessWidget] representing the content of the Post screen
///
/// #### Parameters:
/// - [comingFromUserScreen] : Whether the Screen has been pushed fro the User Screen.
class PostContent extends StatelessWidget {
  const PostContent({super.key, required this.comingFromUserScreen});

  final bool comingFromUserScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: UiConstants.homeContentTopPadding.h,
          left: UiConstants.homeContentPadding.w,
          right: UiConstants.homeContentPadding.w,
        ),
        child: Column(children: [
          /// Top Bar
          NameBackTopBar(
              title: AppLocalizations.of(context)!.post, showBackIcon: true),

          SizedBox(height: UiConstants.homeContentTopPadding.h),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<PostBloc, PostState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case PostStatus.initial:
                          return const ViewCircularProgress();

                        case PostStatus.failure:
                          return Center(
                              child: Text(
                            AppLocalizations.of(context)!.failed_fetch_post,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ));
                        case PostStatus.success:
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ViewContributor(
                                  name: state.post!.authorName,
                                  nameTextStyle: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                  bodyContributor: state.post!.title,
                                  professionTextStyle: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontWeight: FontsWeight.semiBold),
                                  photoUrl: state.post!.authorPhotoUrl,
                                  avatarSize: 35,
                                  spaceBetweenAvatarAndText: 16,
                                  spaceBetweenTexts: 12,
                                  profileIconSize: 24,
                                  isEnabled: true,
                                  onUserAvatarClick: () => comingFromUserScreen
                                      ? Navigator.of(context).pop()
                                      : Navigator.of(context).push(
                                          UserProfileScreen.route(
                                              userId: state.post!.authorId,
                                              postId: state.post!.id)),
                                ),

                                SizedBox(height: 20.h),

                                /// Subtitle
                                Text(state.post!.subtitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)),

                                SizedBox(height: 20.h),

                                /// Image
                                if (state.post!.imageUrl.isNotEmpty)
                                  Center(
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          child: Stack(
                                            children: [
                                              Image.network(
                                                state.post!.imageUrl,
                                                height: 197.h,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  } else {
                                                    return Center(
                                                        child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.h),
                                                      child:
                                                          const ViewCircularProgress(),
                                                    ));
                                                  }
                                                },
                                              ),
                                              if (state.post!.imageUrl
                                                  .isEmpty) // Display CircularProgressIndicator if imageUrl is empty
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5.h),
                                                  child: const Center(
                                                      child:
                                                          ViewCircularProgress()),
                                                ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20.h),
                                      ],
                                    ),
                                  ),

                                /// Subtitle
                                Text(state.post!.body,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),

                                SizedBox(
                                  height: 20.h,
                                ),
                              ]);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
