import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/domain/repository/post_repository.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/home/bloc/following/following_post_bloc.dart';
import 'package:view_app/presentation/home/bloc/following/following_post_event.dart';
import 'package:view_app/presentation/home/bloc/for_you/for_you_post_bloc.dart';
import 'package:view_app/presentation/home/bloc/for_you/for_you_post_event.dart';
import 'package:view_app/presentation/home/bloc/trending_now/trending_now_post_bloc.dart';
import 'package:view_app/presentation/home/bloc/trending_now/trending_now_post_event.dart';
import 'package:view_app/core/de_bouncer.dart';
import 'package:view_app/presentation/home/view/widgets/widgets.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/presentation/widgets/cubits/bookmark/bookmark_cubit.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

part 'home_content.dart';

/// [StatefulWidget] representing the home screen of the app.
///
/// It provides the list of posts currently recommended to the user
/// filtered in base on his/her preferences, the trending now posts,
/// and the following authors posts.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static MaterialPage<void> page() =>
      viewPage(const HomeScreen(), Constants.homeScreen);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
                  FollowingPostBloc(postRepository: getIt<PostRepository>())
                    ..add(const FetchFollowingPosts())),
          BlocProvider(
              create: (_) => ForYouPostBloc(
                  postRepository: getIt<PostRepository>())
                ..add(const FetchForYouPosts(filter: Constants.newestFilter))),
          BlocProvider(
              create: (_) =>
                  TrendingNowPostBloc(postRepository: getIt<PostRepository>())
                    ..add(const FetchTrendingNowPosts()))
        ], child: const SafeArea(child: HomeContent())));
  }
}
