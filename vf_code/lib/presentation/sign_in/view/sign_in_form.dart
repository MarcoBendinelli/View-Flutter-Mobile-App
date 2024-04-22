part of "sign_in_screen.dart";

/// The [SignInForm] is responsible for rendering the form that the user must fill
/// in order to sign in with the email and password and to invoking methods on the SignInCubit
/// in response to user interactions.
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late FocusNode passwordFocusNode;
  late bool isPasswordHidden;

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
    isPasswordHidden = true;
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed
    // to prevent memory leaks
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) async {
        if (state.status.isSuccess) {
          await Future.delayed(const Duration(milliseconds: 400))
              .then((value) => Navigator.of(context).pop());
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
                bottom: UiConstants.authContentVPadding.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// "Sign In Now" title
                  Text(
                    AppLocalizations.of(context)!.sign_in_now,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        letterSpacing: 0.48.sp),
                  ),

                  SizedBox(height: 16.h),

                  /// Subtitle
                  Text(
                    AppLocalizations.of(context)!.log_in_to_see,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(letterSpacing: 0.14.sp),
                  ),

                  SizedBox(height: 70.h),

                  /// Email Text Field
                  BlocBuilder<SignInCubit, SignInState>(
                    buildWhen: (previous, current) =>
                        previous.email != current.email,
                    builder: (context, state) {
                      return TextFieldWithTitleAndError(
                          key: Keys.signInEmailInputKey,
                          title: AppLocalizations.of(context)!.email,
                          label: AppLocalizations.of(context)!.enter_email,
                          error: state.email.isPure
                              ? ''
                              : state.emailValidationMessage,
                          keyboardType: TextInputType.emailAddress,
                          onAction: () => passwordFocusNode.requestFocus(),
                          imeAction: TextInputAction.next,
                          onValueChange: (email) =>
                              context.read<SignInCubit>().emailChanged(email));
                    },
                  ),

                  SizedBox(height: 24.h),

                  /// Password Text Field
                  BlocBuilder<SignInCubit, SignInState>(
                    buildWhen: (previous, current) =>
                        previous.password != current.password,
                    builder: (context, state) {
                      return TextFieldWithTitleAndError(
                          key: Keys.signInPasswordInputKey,
                          textFieldFocusNode: passwordFocusNode,
                          title: AppLocalizations.of(context)!.password,
                          label: AppLocalizations.of(context)!.enter_password,
                          error: state.password.isPure
                              ? ''
                              : state.passwordValidationMessage,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isPasswordHidden,
                          trailingIconSize: 24,
                          trailingIcon: ViewIconButton(
                              size: 24,
                              pathAsset: isPasswordHidden
                                  ? UiConstants.passIconHideAssetPath
                                  : UiConstants.passIconVisibleAssetPath,
                              onClick: () {
                                setState(() {
                                  isPasswordHidden = !isPasswordHidden;
                                });
                              }),
                          onAction: () =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          imeAction: TextInputAction.done,
                          onValueChange: (password) => context
                              .read<SignInCubit>()
                              .passwordChanged(password));
                    },
                  ),

                  SizedBox(height: 24.h),

                  /// Forgot Password Button
                  ViewClickableText(
                      key: Keys.signInForgotPasswordButtonKey,
                      onTap: () {
                        Navigator.of(context)
                            .push(ForgotPasswordScreen.route());
                      },
                      text: AppLocalizations.of(context)!.forgot_password,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.viewBlueVariation,
                          fontWeight: FontsWeight.regular)),

                  SizedBox(height: 30.h),

                  /// Sign In Button
                  BlocBuilder<SignInCubit, SignInState>(
                    builder: (context, state) {
                      return state.status.isInProgress
                          ? const ViewCircularProgress()
                          : ViewTextButton(
                              key: Keys.signInFormButtonKey,
                              textContent:
                                  AppLocalizations.of(context)!.sign_in,
                              enabled: state.isValid,
                              onClick: () {
                                context
                                    .read<SignInCubit>()
                                    .logInWithCredentials();
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
