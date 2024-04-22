part of 'widgets.dart';

class TrendingNowPosts extends StatelessWidget {
  const TrendingNowPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingNowPostBloc, TrendingNowPostState>(
        builder: (context, state) {
      switch (state.status) {
        case TrendingNowPostStatus.initial:
          return const ViewCircularProgress();

        case TrendingNowPostStatus.failure:
          return Center(
              child: Text(
            AppLocalizations.of(context)!.failed_fetch_posts,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ));

        case TrendingNowPostStatus.success:
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
          return Column(
            children: state.posts
                .map((post) => Column(
                      children: [
                        ViewSmallPostPreview(
                          post: post,
                          comingFromPostId: 'Nothing',
                          comingFromUserScreen: false,
                        ),
                        state.posts.length == 1
                            ? const SizedBox()
                            : state.posts.first == post
                                ? Divider(height: 40.h)
                                : const SizedBox(),
                      ],
                    ))
                .toList(),
          );
      }
    });
  }
}
