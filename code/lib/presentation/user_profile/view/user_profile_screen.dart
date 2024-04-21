import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/core/de_bouncer.dart';
import 'package:view_app/di/injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/domain/repository/post_repository.dart';
import 'package:view_app/domain/repository/user_profile_repository.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/user_profile/bloc/user_posts/user_posts_bloc.dart';
import 'package:view_app/presentation/user_profile/bloc/user_profile/user_profile_bloc.dart';
import 'package:view_app/presentation/user_profile/cubit/follow_cubit.dart';
import 'package:view_app/presentation/user_profile/view/widgets/user_posts.dart';
import 'package:view_app/presentation/user_profile/view/widgets/user_summary.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

part 'user_profile_content.dart';

/// [StatelessWidget] representing the User screen allowing the user
/// to read the corresponded user profile data.
///
/// #### Parameters:
/// - [userId] : The id of the user to display.
/// - [comingFromPostId] : The id of the post from which the user clicked the avatar to navigate to the User Screen.
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen(
      {required this.userId, required this.comingFromPostId, super.key});

  final String userId;
  final String comingFromPostId;

  static MaterialPageRoute<void> route(
          {required String userId, required String postId}) =>
      viewRoute(UserProfileScreen(userId: userId, comingFromPostId: postId),
          Constants.userProfileScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<UserPostsBloc>(
            create: (_) =>
                UserPostsBloc(postRepository: getIt<PostRepository>())
                  ..add(FetchUserPosts(userId)),
          ),
          BlocProvider<UserProfileBloc>(
            create: (_) =>
                UserProfileBloc(userRepository: getIt<UserProfileRepository>())
                  ..add(FetchUserProfile(userId)),
          ),
          BlocProvider(
              create: (_) => FollowCubit(getIt<UserProfileRepository>())),
        ],
        child: SafeArea(
            child: UserProfileContent(
          comingFromPostId: comingFromPostId,
          userId: userId,
        )),
      ),
    );
  }
}
