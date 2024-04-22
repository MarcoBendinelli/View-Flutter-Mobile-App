part of "sign_up_screen.dart";

/// The [SignUpForm] is responsible for rendering the form that the user must fill
/// in order to sign up with the email and password and invoking methods
/// on the SignUpCubit in response to user interactions.
class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late FocusNode passwordFocusNode;
  late FocusNode repeatPasswordFocusNode;
  late bool isPasswordHidden;

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
    repeatPasswordFocusNode = FocusNode();
    isPasswordHidden = true;
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed
    // to prevent memory leaks
    passwordFocusNode.dispose();
    repeatPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          /// The user is starting the first selection phase
          context.read<AppBloc>().startingSelectionPhase();

          /// Change the [AppStatus] to redirect the user to the selection screen
          context.read<AppBloc>().add(const LoadFirstSelection());

          /// Pop to trigger the FlowBuilder
          Navigator.of(context).pop();
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
                  /// "Sign Up Now" title
                  Text(
                    AppLocalizations.of(context)!.sign_up_now,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        letterSpacing: 0.48.sp),
                  ),

                  SizedBox(height: 16.h),

                  /// Subtitle
                  Text(
                    AppLocalizations.of(context)!.sign_up_to_see,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(letterSpacing: 0.14.sp),
                  ),

                  SizedBox(height: 50.h),

                  /// Email Text Field
                  BlocBuilder<SignUpCubit, SignUpState>(
                    buildWhen: (previous, current) =>
                        previous.email != current.email,
                    builder: (context, state) {
                      return TextFieldWithTitleAndError(
                          key: Keys.signUpEmailInputKey,
                          title: AppLocalizations.of(context)!.email,
                          label: AppLocalizations.of(context)!.enter_email,
                          error: state.email.isPure
                              ? ''
                              : state.emailValidationMessage,
                          keyboardType: TextInputType.emailAddress,
                          onAction: () => passwordFocusNode.requestFocus(),
                          imeAction: TextInputAction.next,
                          onValueChange: (email) =>
                              context.read<SignUpCubit>().emailChanged(email));
                    },
                  ),

                  SizedBox(height: 24.h),

                  /// Password Text Field
                  BlocBuilder<SignUpCubit, SignUpState>(
                    buildWhen: (previous, current) =>
                        previous.password != current.password,
                    builder: (context, state) {
                      return TextFieldWithTitleAndError(
                          key: Keys.signUpPasswordInputKey,
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
                              repeatPasswordFocusNode.requestFocus(),
                          imeAction: TextInputAction.next,
                          onValueChange: (password) => context
                              .read<SignUpCubit>()
                              .passwordChanged(password));
                    },
                  ),

                  SizedBox(height: 24.h),

                  /// Repeated Password Text Field
                  BlocBuilder<SignUpCubit, SignUpState>(
                    buildWhen: (previous, current) =>
                        previous.confirmedPassword != current.confirmedPassword,
                    builder: (context, state) {
                      return TextFieldWithTitleAndError(
                          key: Keys.signUpConfirmedPasswordInputKey,
                          textFieldFocusNode: repeatPasswordFocusNode,
                          title: AppLocalizations.of(context)!.confirm_password,
                          label: AppLocalizations.of(context)!
                              .enter_confirm_password,
                          error: state.confirmedPassword.isPure
                              ? ''
                              : state.confirmedPasswordValidationMessage,
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
                              .read<SignUpCubit>()
                              .confirmedPasswordChanged(password));
                    },
                  ),

                  SizedBox(height: 30.h),

                  /// Sign Up Button
                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return state.status.isInProgress
                          ? const ViewCircularProgress()
                          : ViewTextButton(
                              key: Keys.signUpFormButtonKey,
                              textContent:
                                  AppLocalizations.of(context)!.sign_up,
                              enabled: state.isValid,
                              onClick: () {
                                context
                                    .read<SignUpCubit>()
                                    .signUpFormSubmitted();
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
            )
          ],
        ),
      ),
    );
  }
}
