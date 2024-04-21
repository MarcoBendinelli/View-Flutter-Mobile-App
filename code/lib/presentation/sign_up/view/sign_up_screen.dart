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
import 'package:view_app/presentation/sign_up/sign_up.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'sign_up_form.dart';

/// The [SignUpScreen] allows users to sign up with their email and password.
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static MaterialPageRoute<void> route() =>
      viewRoute(const SignUpScreen(), Constants.signUpScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocProvider<SignUpCubit>(
        create: (_) => SignUpCubit(
            authenticationRepository: context.read<AuthenticationRepository>(),
            emailNotBlankMessage: AppLocalizations.of(context)!.email_not_blank,
            invalidEmailMessage:
                AppLocalizations.of(context)!.invalid_email_address,
            shortPasswordMessage:
                AppLocalizations.of(context)!.password_at_least,
            passwordLetterOrDigitPassword:
                AppLocalizations.of(context)!.password_letter_digit,
            passwordsNotMatch:
                AppLocalizations.of(context)!.passwords_not_match),
        child: const SafeArea(child: SignUpForm()),
      ),
    );
  }
}
