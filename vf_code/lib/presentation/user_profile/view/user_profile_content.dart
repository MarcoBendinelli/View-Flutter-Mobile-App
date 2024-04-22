part of 'user_profile_screen.dart';

/// [StatelessWidget] representing the content of the User screen
///
/// #### Parameters:
/// - [comingFromPostId] : The id of the post from which the user clicked the avatar to navigate to the User Screen.
/// - [userId] : The id of the user to display.
class UserProfileContent extends StatefulWidget {
  const UserProfileContent(
      {super.key, required this.comingFromPostId, required this.userId});

  final String comingFromPostId;
  final String userId;

  @override
  State<UserProfileContent> createState() => _UserProfileContentState();
}

class _UserProfileContentState extends State<UserProfileContent> {
  /// The scroll controller to detect when the user reaches the bottom.
  late ScrollController _scrollController;

  /// A deBouncer to prevent rapid firing of events during scrolling.
  final _deBouncer = DeBouncer();

  /// The threshold at which a new page should be fetched.
  final _scrollThreshold = 1.0;

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
        context.read<UserPostsBloc>().add(FetchUserPosts(widget.userId));
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
    return Padding(
        padding: EdgeInsets.only(
          top: UiConstants.homeContentTopPadding.h,
          left: UiConstants.homeContentPadding.w,
          right: UiConstants.homeContentPadding.w,
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          /// Top Bar
          NameBackTopBar(
              title: AppLocalizations.of(context)!.user, showBackIcon: true),

          SizedBox(height: UiConstants.homeContentTopPadding.h),

          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  /// User summary
                  const UserSummary(),

                  SizedBox(height: 30.h),

                  /// User Posts
                  UserPosts(comingFromPostId: widget.comingFromPostId)
                ],
              ),
            ),
          )
        ]));
  }
}
