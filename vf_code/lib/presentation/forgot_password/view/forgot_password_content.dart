part of "forgot_password_screen.dart";

class ForgotPasswordContent extends StatelessWidget {
  const ForgotPasswordContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).push(EmailSentScreen.route());
        } else if (state.status.isFailure) {
          Utils.showErrorSnackBar(
              context, state.errorMessage ?? UiConstants.defaultErrorMessage);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// Top Bar
            BackSkipTopBar(onTap: () {
              Navigator.pop(context);
            }),
            Padding(
              padding: EdgeInsets.only(
                  left: UiConstants.authContentHPadding.w,
                  right: UiConstants.authContentHPadding.w,
                  top: UiConstants.authContentTopPadding.h,
                  bottom: UiConstants.authContentVPadding.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    AppLocalizations.of(context)!.reset_password,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        letterSpacing: 0.48),
                  ),

                  SizedBox(height: 16.h),

                  /// Body
                  Text(
                    AppLocalizations.of(context)!.reset_pss_body,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(letterSpacing: 0.14),
                  ),

                  SizedBox(height: 60.h),

                  /// Email Text Field
                  BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    buildWhen: (previous, current) =>
                        previous.email != current.email,
                    builder: (context, state) {
                      return TextFieldWithTitleAndError(
                          key: Keys.forgotPasswordEmailInputKey,
                          title: AppLocalizations.of(context)!.email,
                          label: AppLocalizations.of(context)!.enter_email,
                          error:
                              state.email.isPure ? '' : state.validationMessage,
                          keyboardType: TextInputType.emailAddress,
                          onAction: () =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          imeAction: TextInputAction.done,
                          onValueChange: (email) => context
                              .read<ForgotPasswordCubit>()
                              .emailChanged(email));
                    },
                  ),

                  SizedBox(height: 30.h),

                  /// Reset Password button
                  BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
                      return state.status.isInProgress
                          ? const ViewCircularProgress()
                          : ViewTextButton(
                              key: Keys.forgotPasswordResetButton,
                              textContent:
                                  AppLocalizations.of(context)!.reset_password,
                              enabled: state.isValid,
                              onClick: () {
                                context
                                    .read<ForgotPasswordCubit>()
                                    .sendPasswordResetEmail();
                              },
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
