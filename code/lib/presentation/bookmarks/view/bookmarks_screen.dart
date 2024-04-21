import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/domain/repository/post_repository.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/presentation/bookmarks/bloc/bookmarked_post_bloc.dart';
import 'package:view_app/presentation/bookmarks/view/widgets/bookmarked_posts.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/presentation/widgets/cubits/bookmark/bookmark_cubit.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

part 'bookmarks_content.dart';

/// [StatefulWidget] representing the screen in charge of showing
/// the bookmarked posts by the user.
class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen>
    with AutomaticKeepAliveClientMixin {
  /// Override method from AutomaticKeepAliveClientMixin.
  /// This method is called automatically and determines whether to keep the state alive.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: MultiBlocProvider(providers: [
          BlocProvider(create: (_) => BookmarkCubit(getIt<PostRepository>())),
          BlocProvider(
              create: (_) =>
                  BookmarkedPostBloc(postRepository: getIt<PostRepository>())
                    ..add(const FetchBookmarkedPosts())),
        ], child: const SafeArea(child: BookmarksContent())));
  }
}
