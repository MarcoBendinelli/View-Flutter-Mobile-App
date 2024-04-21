import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/domain/repository/post_repository.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/post/bloc/post_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/user_profile/view/user_profile_screen.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

part 'post_content.dart';

/// [StatelessWidget] representing the Post screen allowing the user
/// to read the corresponded post data.
///
/// #### Parameters:
/// - [postId] : The id of the post to display.
/// - [comingFromUserScreen] : Whether the Screen has been pushed fro the User Screen.
class PostScreen extends StatelessWidget {
  const PostScreen(
      {super.key, required this.postId, required this.comingFromUserScreen});

  final String postId;
  final bool comingFromUserScreen;

  static MaterialPageRoute<void> route(
          {required String postId, required bool comingFromUserScreen}) =>
      viewRoute(
          PostScreen(
              postId: postId, comingFromUserScreen: comingFromUserScreen),
          Constants.postScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocProvider<PostBloc>(
        create: (_) => PostBloc(postRepository: getIt<PostRepository>())
          ..add(FetchPost(postId)),
        child: SafeArea(
            child: PostContent(comingFromUserScreen: comingFromUserScreen)),
      ),
    );
  }
}
