import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/app/bloc/app_event.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/domain/repository/first_user_selection_repository.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/first_user_selection/bloc/topics_users_bloc.dart';
import 'package:view_app/presentation/first_user_selection/cubit/first_selection_cubit.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'user_selection_content.dart';

/// The [UserSelectionScreen] widget represents the screen for contributor selection
/// during the first app experience.
class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});

  static MaterialPageRoute<void> route() =>
      viewRoute(const UserSelectionScreen(), Constants.userSelectionScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: MultiBlocProvider(providers: [
        BlocProvider(
            create: (_) => TopicsUsersBloc(
                firstUserSelectionRepository:
                    getIt<FirstUserSelectionRepository>())
              ..add(const FetchUsers())),
        BlocProvider(
            create: (_) => FirstSelectionCubit(
                firstUserSelectionRepository:
                    getIt<FirstUserSelectionRepository>()))
      ], child: const SafeArea(child: UserSelectionContent())),
    );
  }
}
