import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/core/keys.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/email_sent/view/email_sent_screen.dart';
import 'package:view_app/presentation/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

part 'forgot_password_content.dart';

/// The [ForgotPasswordScreen] widget represents the screen
/// for resetting the password
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  static MaterialPageRoute<void> route() =>
      viewRoute(const ForgotPasswordScreen(), Constants.forgotPasswordScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocProvider(
          create: (_) => ForgotPasswordCubit(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
              notBlankMessage: AppLocalizations.of(context)!.email_not_blank,
              invalidEmailMessage:
                  AppLocalizations.of(context)!.invalid_email_address),
          child: const SafeArea(child: ForgotPasswordContent())),
    );
  }
}
