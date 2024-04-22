import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/core/keys.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/presentation/user_profile/bloc/user_posts/user_posts_bloc.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// The posts list of the user.
///
/// #### Parameters:
/// - [comingFromPostId] : The id of the post from which the user clicked the avatar to navigate to the User Screen.
class UserPosts extends StatelessWidget {
  const UserPosts({super.key, required this.comingFromPostId});

  final String comingFromPostId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPostsBloc, UserPostsState>(
      builder: (context, state) {
        /// List to store the displayed posts
        List<ViewPost> posts = [];

        switch (state.status) {
          case UserPostsStatus.initial:
            return const ViewCircularProgress();

          case UserPostsStatus.failure:
            return Center(
                child: Text(
              AppLocalizations.of(context)!.failed_fetch_posts,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ));

          case UserPostsStatus.success:
            if (state.posts.isEmpty) {
              return Center(
                  child: Text(
                AppLocalizations.of(context)!.no_post,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ));
            }

            /// If there are new posts update the list with the latest posts.
            if (state.posts.length >= posts.length) {
              posts = state.posts;
            } else {
              /// Otherwise replace the posts with the updated ones.
              for (var post in state.posts) {
                int index = posts.indexWhere((p) => p.id == post.id);
                if (index != -1) {
                  posts[index] = post;
                }
              }
            }

            return Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    if (index == posts.length - 1) {
                      return const SizedBox();
                    } else {
                      return Divider(height: 40.h);
                    }
                  },
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: EdgeInsets.only(
                        bottom: !state.hasMoreData && index == posts.length - 1
                            ? 20.h
                            : 0),
                    child: ViewSmallPostPreview(
                      key: Keys.postKey(index),
                      post: posts[index],
                      comingFromPostId: comingFromPostId,
                      comingFromUserScreen: true,
                    ),
                  ),
                  itemCount: posts.length,
                ),
                state.hasMoreData
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: const ViewSmallCircularProgress(),
                      )
                    : const SizedBox(),
              ],
            );
        }
      },
    );
  }
}
