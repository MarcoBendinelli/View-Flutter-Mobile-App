part of "home_screen.dart";

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  /// The scroll controller to detect when the user reaches the bottom.
  late ScrollController _scrollController;

  /// A deBouncer to prevent rapid firing of events during scrolling.
  final _deBouncer = DeBouncer();

  /// The threshold at which a new page should be fetched.
  final _scrollThreshold = 1.0;

  /// Current selected Filter by the user.
  late String _filter = AppLocalizations.of(context)!.newest;

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
    if (_isBottom) {
      // Debounce the fetch posts event to avoid rapid firing during scrolling.
      _deBouncer.run(() {
        // Fetch the following posts.
        context.read<FollowingPostBloc>().add(const FetchFollowingPosts());
      });
    }
  }

  /// Checks if the user has reached the bottom of the scroll.
  bool get _isBottom {
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
    final userId = context.select((AppBloc bloc) => bloc.state.user.id);
    final username = context.select((AppBloc bloc) => bloc.state.user.username);
    final photoUrl = context.select((AppBloc bloc) => bloc.state.user.photoUrl);

    final List<String> topics =
        List.from(context.select((AppBloc bloc) => bloc.state.user.topics));
    if (topics.isNotEmpty) {
      topics.sort((a, b) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      });
    }

    return BlocListener<BookmarkCubit, BookmarkState>(
      listener: (context, state) {
        if (state is FailureBookmarkState) {
          Utils.showErrorSnackBar(context, state.errorMessage);
        }
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: UiConstants.homeContentPadding.h,
                horizontal: UiConstants.homeContentPadding.w),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Home Top Bar
                  HomeTopBar(
                      userId: userId, username: username, photoUrl: photoUrl),

                  SizedBox(height: 30.h),

                  /// Filter Buttons
                  ScrollableFilters(
                    showNewestTopic: true,
                    topics: topics,
                    callback: (selectedFilter) {
                      setState(() {
                        _filter = selectedFilter;
                      });
                      context
                          .read<ForYouPostBloc>()
                          .add(FetchForYouPosts(filter: _filter));
                    },
                    selectedFilter: _filter,
                  ),

                  SizedBox(height: 40.h),

                  /// For you
                  Text(
                    AppLocalizations.of(context)!.for_you,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),

                  SizedBox(height: 10.h),

                  /// For you body
                  Text(
                    AppLocalizations.of(context)!.for_you_body,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  SizedBox(height: 20.h),

                  /// For you card posts
                  ForYouPostCards(
                      selectedFilter:
                          _filter == AppLocalizations.of(context)!.newest
                              ? Constants.newestFilter
                              : _filter),

                  SizedBox(height: 40.h),

                  /// Trending Now
                  Text(
                    AppLocalizations.of(context)!.trending_now,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontsWeight.bold),
                  ),

                  SizedBox(height: 20.h),

                  /// Trending Now Posts
                  const TrendingNowPosts(),

                  SizedBox(height: 40.h),

                  /// Following
                  Text(AppLocalizations.of(context)!.following,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              fontWeight: FontsWeight.bold,
                              color: Theme.of(context).colorScheme.secondary)),

                  SizedBox(height: 20.h),

                  /// Following Posts
                  const FollowingPosts(),
                ])),
      ),
    );
  }
}
