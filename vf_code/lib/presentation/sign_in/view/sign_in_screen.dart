import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/core/keys.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/navigation/routing_utils.dart';
import 'package:view_app/presentation/forgot_password/forgot_password.dart';
import 'package:view_app/presentation/sign_in/sign_in.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

part 'sign_in_form.dart';

/// The [SignInScreen] widget represents the screen for user sign-in with email and password.
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static MaterialPageRoute<void> route() =>
      viewRoute(const SignInScreen(), Constants.signInScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocProvider(
        create: (_) => SignInCubit(
            authenticationRepository: context.read<AuthenticationRepository>(),
            emailNotBlankMessage: AppLocalizations.of(context)!.email_not_blank,
            invalidEmailMessage:
                AppLocalizations.of(context)!.invalid_email_address,
            tooShortPasswordMessage:
                AppLocalizations.of(context)!.password_at_least,
            missingLetterOrDigitMessage:
                AppLocalizations.of(context)!.password_letter_digit),
        child: const SafeArea(child: SignInForm()),
      ),
    );
  }
}
