import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/core/keys.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/domain/repository/first_user_selection_repository.dart';
import 'package:view_app/domain/repository/post_repository.dart';
import 'package:view_app/presentation/add_post/view/cubit/add_post/add_post_cubit.dart';
import 'package:view_app/presentation/add_post/view/cubit/required_fields/required_fields_cubit.dart';
import 'package:view_app/presentation/widgets/cubits/topics/topics_cubit.dart';
import 'package:view_app/presentation/add_post/view/widgets/add_post_text_field.dart';
import 'package:view_app/presentation/add_post/view/widgets/add_post_top_bar.dart';
import 'package:view_app/presentation/add_post/view/widgets/upload_image.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/from_bottom_page_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

import 'cubit/first_topic/first_topic_cubit.dart';

part 'add_post_content.dart';

/// The [AddPostScreen] widget represents the screen to create a new post.
class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  static FromBottomPageRoute route() =>
      FromBottomPageRoute(builder: (newContext) => const AddPostScreen());

  @override
  Widget build(BuildContext context) {
    /// Provides an instance of topics retrieved from the [arb] file.
    try {
      getIt.registerSingleton<String>(AppLocalizations.of(context)!.topics);
    } catch (e) {
      debugPrint("Topics already registered");
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => RequiredFieldsCubit()),
              BlocProvider(
                  create: (_) => AddPostCubit(getIt<PostRepository>())),
              BlocProvider(
                  create: (_) =>
                      TopicsCubit(getIt<FirstUserSelectionRepository>())
                        ..getTopics()),
              BlocProvider(
                  create: (_) =>
                      FirstTopicCubit(getIt<FirstUserSelectionRepository>())
                        ..getFirstTopic())
            ],
            child: SafeArea(
                child: Stack(children: [
              const AddPostContent(),
              BlocBuilder<AddPostCubit, AddPostState>(
                  builder: (context, state) {
                if (state is LoadingAddPostState) {
                  return const ViewCircularProgress();
                }
                return const SizedBox();
              }),
            ]))));
  }
}
