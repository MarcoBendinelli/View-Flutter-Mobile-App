import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/data/model/view_post.dart';
import 'package:view_app/presentation/bookmarks/bloc/bookmarked_post_bloc.dart';
import 'package:view_app/core/de_bouncer.dart';
import 'package:view_app/presentation/widgets/cubits/bookmark/bookmark_cubit.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [StatefulWidget] to show the saved posts by the user
/// in a scrollable list with posts loading on scroll.
class BookmarkedPosts extends StatefulWidget {
  const BookmarkedPosts({super.key});

  @override
  State<BookmarkedPosts> createState() => _BookmarkedPostsState();
}

class _BookmarkedPostsState extends State<BookmarkedPosts> {
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
        context.read<BookmarkedPostBloc>().add(const FetchBookmarkedPosts());
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
    return BlocBuilder<BookmarkedPostBloc, BookmarkedPostState>(
      builder: (context, state) {
        /// List to store the displayed posts
        List<ViewPost> posts = [];

        switch (state.status) {
          case BookmarkedPostStatus.initial:
            return const ViewCircularProgress();

          case BookmarkedPostStatus.failure:
            return Center(
                child: Text(
              AppLocalizations.of(context)!.failed_fetch_posts,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ));

          case BookmarkedPostStatus.success:
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
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      if (index == posts.length - 1) {
                        return const SizedBox();
                      } else {
                        return Divider(height: 50.h);
                      }
                    },
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: !state.hasMoreData &&
                                      index == posts.length - 1
                                  ? 25.h
                                  : 0),
                          child: ViewBigPostPreview(
                            post: posts[index],
                            onBookmarkClick: () {
                              context
                                  .read<BookmarkCubit>()
                                  .bookmarkPost(posts[index].id);
                            },
                          ),
                        ),
                      ],
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
              ),
            );
        }
      },
    );
  }
}
