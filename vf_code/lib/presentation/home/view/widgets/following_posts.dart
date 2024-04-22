part of 'widgets.dart';

/// [StatelessWidget] that displays the list of [ViewBigPostPreview].
///
/// This widget listens to the [FollowingPostBloc] and displays posts based on the
/// current state of the bloc.
class FollowingPosts extends StatelessWidget {
  const FollowingPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowingPostBloc, FollowingPostState>(
      builder: (context, state) {
        /// List to store the displayed posts
        List<ViewPost> posts = [];

        switch (state.status) {
          case FollowingPostStatus.initial:
            return const ViewCircularProgress();

          case FollowingPostStatus.failure:
            return Center(
                child: Text(
              AppLocalizations.of(context)!.failed_fetch_posts,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ));

          case FollowingPostStatus.success:
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
                  itemBuilder: (BuildContext context, int index) =>
                      ViewBigPostPreview(
                    post: posts[index],
                    onBookmarkClick: () {
                      context
                          .read<BookmarkCubit>()
                          .bookmarkPost(posts[index].id);
                    },
                  ),
                  itemCount: posts.length,
                ),
                state.hasMoreData
                    ? Padding(
                        padding: EdgeInsets.only(top: 12.h),
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
