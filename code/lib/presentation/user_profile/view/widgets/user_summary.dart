import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/user_profile/bloc/user_posts/user_posts_bloc.dart';
import 'package:view_app/presentation/user_profile/bloc/user_profile/user_profile_bloc.dart';
import 'package:view_app/presentation/user_profile/cubit/follow_cubit.dart';
import 'package:view_app/presentation/user_profile/view/widgets/statistics.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

/// Top section of the user screen, displaying user related information
/// such as profile image, name, profession, and statistics on followers, following, and the number
/// of posts published. It also includes a button for following the user.
class UserSummary extends StatelessWidget {
  const UserSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = context.select((AppBloc bloc) => bloc.state.user.id);

    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        switch (state.status) {
          case UserProfileStatus.initial:
            return const ViewCircularProgress();

          case UserProfileStatus.failure:
            return Center(
                child: Text(
              AppLocalizations.of(context)!.failed_fetch_user,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ));

          case UserProfileStatus.success:
            ViewUser user = state.user!;

            return Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Profile Image
                    ViewAvatar(
                        photoUrl: user.photoUrl,
                        size: 46,
                        iconSize: 32,
                        isEnabled: false,
                        onUserClick: () {}),

                    SizedBox(height: 30.h),

                    /// Follow the contributor button
                    if (currentUserId != user.id)
                      Column(
                        children: [
                          BlocBuilder<FollowCubit, FollowState>(
                            builder: (context, state) {
                              if (state is LoadingFollowState) {
                                return const ViewCircularProgress();
                              } else {
                                return FollowButton(
                                    widthBorder: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: AppColors.viewBlue,
                                            fontWeight: FontsWeight.semiBold),
                                    sizeShape: 14,
                                    widthButton: 104,
                                    heightButton: 38,
                                    enabled:
                                        !user.followers.contains(currentUserId),
                                    onClick: () => context
                                        .read<FollowCubit>()
                                        .followUser(user.id));
                              }
                            },
                          ),
                          SizedBox(height: 25.h),
                        ],
                      ),

                    Text(
                      user.username,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary),
                    ),

                    SizedBox(height: 10.h),

                    Text(user.profession,
                        style: Theme.of(context).textTheme.titleSmall),

                    SizedBox(height: 30.h),

                    BlocBuilder<UserPostsBloc, UserPostsState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case UserPostsStatus.initial:
                            return const ViewCircularProgress();

                          case UserPostsStatus.failure:
                            return Statistics(
                                numOfFollowers: user.followers.length,
                                numOfFollowing: user.following.length,
                                numOfPosts: 0);
                          case UserPostsStatus.success:
                            return Statistics(
                                numOfFollowers: user.followers.length,
                                numOfFollowing: user.following.length,
                                numOfPosts: state.posts.length);
                        }
                      },
                    ),

                    SizedBox(height: 50.h)
                  ],
                ),

                /// "Posts from" or "Posts" title
                Text(
                  state.user!.username.contains("@")
                      ? AppLocalizations.of(context)!.posts
                      : "${AppLocalizations.of(context)!.posts_from} ${state.user!.username.trim().split(RegExp(r'\s+'))[0]}",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ],
            );
        }
      },
    );
  }
}
