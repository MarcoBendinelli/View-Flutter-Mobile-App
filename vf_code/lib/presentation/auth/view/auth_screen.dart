import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:view_app/app/app.dart';
import 'package:view_app/app/bloc/app_event.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/core/keys.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/auth/auth.dart';
import 'package:view_app/presentation/auth/view/widgets/continue_with_button.dart';
import 'package:view_app/presentation/sign_in/sign_in.dart';
import 'package:view_app/presentation/sign_up/sign_up.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'auth_content.dart';

/// The [AuthScreen] widget represents the main authentication screen.
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static MaterialPage<void> page() =>
      viewPage(const AuthScreen(), Constants.authScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: BlocProvider(
            create: (_) => AuthCubit(context.read<AuthenticationRepository>()),
            child: const SafeArea(child: AuthContent())));
  }
}
