import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/core/keys.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/data/model/view_topic.dart';
import 'package:view_app/domain/repository/first_user_selection_repository.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/first_user_selection/bloc/topics_users_bloc.dart';
import 'package:view_app/presentation/first_user_selection/cubit/first_selection_cubit.dart';
import 'package:view_app/presentation/first_user_selection/view/user_selection/user_selection_screen.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

part 'topic_selection_content.dart';

/// The [TopicSelectionScreen] widget represents the screen for topic selection
/// during the first app experience.
class TopicSelectionScreen extends StatelessWidget {
  const TopicSelectionScreen({super.key});

  static MaterialPage<void> page() =>
      viewPage(const TopicSelectionScreen(), Constants.topicSelectionScreen);

  @override
  Widget build(BuildContext context) {
    /// Provides an instance of topics retrieved from the [arb] file.
    try {
      getIt.registerSingleton<String>(AppLocalizations.of(context)!.topics);
    } catch (e) {
      debugPrint("Topics already registered");
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: MultiBlocProvider(providers: [
        BlocProvider(
            create: (_) => TopicsUsersBloc(
                firstUserSelectionRepository:
                    getIt<FirstUserSelectionRepository>())
              ..add(const LoadTopics())),
        BlocProvider(
            create: (_) => FirstSelectionCubit(
                firstUserSelectionRepository:
                    getIt<FirstUserSelectionRepository>()))
      ], child: const SafeArea(child: TopicSelectionContent())),
    );
  }
}
