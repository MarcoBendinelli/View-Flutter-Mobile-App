import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/app/bloc/app_event.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/domain/repository/first_user_selection_repository.dart';
import 'package:view_app/domain/repository/user_profile_repository.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/edit_profile/cubit/required_fields/required_fields_cubit.dart';
import 'package:view_app/presentation/edit_profile/cubit/update_profile/update_profile_cubit.dart';
import 'package:view_app/presentation/edit_profile/view/widgets/edit_profile_text_field.dart';
import 'package:view_app/presentation/edit_profile/view/widgets/scrollable_multi_selection_topics.dart';
import 'package:view_app/presentation/edit_profile/view/widgets/update_profile_image.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/cubits/topics/topics_cubit.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'edit_profile_content.dart';

/// [StatelessWidget] allowing the User to modify its personal information.
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  static MaterialPageRoute<void> route() =>
      viewRoute(const EditProfileScreen(), Constants.editProfileScreen);

  @override
  Widget build(BuildContext context) {
    /// Provides an instance of topics retrieved from the [arb] file.
    try {
      getIt.registerSingleton<String>(AppLocalizations.of(context)!.topics);
    } catch (e) {
      debugPrint("Topics already registered");
    }

    final username = context.select((AppBloc bloc) => bloc.state.user.username);
    final profession =
        context.select((AppBloc bloc) => bloc.state.user.profession);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: MultiBlocProvider(providers: [
        BlocProvider(
            create: (_) => TopicsCubit(getIt<FirstUserSelectionRepository>())
              ..getTopics()),
        BlocProvider(
            create: (_) => RequiredFieldsCubit(
                currentUsername: username, currentProfession: profession)),
        BlocProvider(
            create: (_) => UpdateProfileCubit(getIt<UserProfileRepository>())),
      ], child: const SafeArea(child: EditProfileContent())),
    );
  }
}
