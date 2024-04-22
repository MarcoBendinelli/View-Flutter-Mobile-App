part of 'widgets.dart';

/// [StatelessWidget] to display a horizontally-scrolling list of [ForYouPostCard].
class ForYouPostCards extends StatefulWidget {
  const ForYouPostCards({super.key, required this.selectedFilter});

  final String selectedFilter;

  @override
  State<ForYouPostCards> createState() => _ForYouPostCardsState();
}

class _ForYouPostCardsState extends State<ForYouPostCards> {
  /// The scroll controller to detect when the user reaches the bottom.
  late ScrollController _scrollController;

  /// A deBouncer to prevent rapid firing of events during scrolling.
  final _deBouncer = DeBouncer();

  /// The threshold at which a new page should be fetched.
  final _scrollThreshold = 0.9;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  /// Callback function when the user scrolls.
  void _onScroll() {
    if (_isAtTheEnd) {
      // Debounce the fetch posts event to avoid rapid firing during scrolling
      _deBouncer.run(() {
        context
            .read<ForYouPostBloc>()
            .add(FetchForYouPosts(filter: widget.selectedFilter));
      });
    }
  }

  /// Checks if the user has reached the bottom of the scroll.
  bool get _isAtTheEnd {
    // Retrieves the maximum possible scroll offset.
    final maxScroll = _scrollController.position.maxScrollExtent;
    // /Retrieves the current scroll offset.
    final currentScroll = _scrollController.offset;
    // Checks if the current scroll position is greater than or equal
    // to a certain threshold relative to the maximum scroll extent.
    return currentScroll >= (maxScroll * _scrollThreshold);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForYouPostBloc, ForYouPostState>(
      builder: (context, state) {
        /// List to store the displayed posts
        List<ViewPost> posts = [];

        switch (state.status) {
          case ForYouPostStatus.initial:
            return const ViewCircularProgress();

          case ForYouPostStatus.failure:
            return Center(
                child: Text(
              AppLocalizations.of(context)!.failed_fetch_posts,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ));

          case ForYouPostStatus.success:
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

            return SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Row(
                        children: posts
                            .map((post) => Padding(
                                padding: EdgeInsets.only(
                                    right: posts.last == post ? 0 : 24.w),
                                child: ForYouPostCard(post: post)))
                            .toList()),
                    state.hasMoreData
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: const ViewSmallCircularProgress(),
                          )
                        : const SizedBox(),
                  ],
                ));
        }
      },
    );
  }
}
