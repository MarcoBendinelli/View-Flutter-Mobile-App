part of "auth_screen.dart";

class AuthContent extends StatefulWidget {
  const AuthContent({super.key});

  @override
  State<AuthContent> createState() => _AuthContentState();
}

class _AuthContentState extends State<AuthContent> {
  bool isAlreadySignedUp = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          /// If the user is signing in, change the AppStatus to authenticated
          /// and redirect the user to the Home Screen
          if (isAlreadySignedUp) {
            context.read<AppBloc>().selectionPhaseEnded();
            context.read<AppBloc>().add(const LoadUser());

            /// If the user is signing up, change the AppStatus to allow
            /// the user to do the first selection phase
          } else {
            context.read<AppBloc>().add(const LoadFirstSelection());
          }
        } else if (state.status.isFailure) {
          /// Reset the app status
          context.read<AppBloc>().selectionPhaseEnded();

          Utils.showErrorSnackBar(
              context, state.errorMessage ?? UiConstants.defaultErrorMessage);
        }
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: UiConstants.authContentHPadding.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 140.h),

            /// App Logo
            const ViewLogo(),

            SizedBox(height: 20.h),

            /// Welcome text
            Text(
              AppLocalizations.of(context)!.welcome,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),

            SizedBox(height: 20.h),

            /// Welcome subtitle text
            Text(
              AppLocalizations.of(context)!.welcome_subtitle,
              style: Theme.of(context).textTheme.bodyLarge!,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 80.h),

            /// Google sign in
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return state.status.isInProgress
                    ? const ViewCircularProgress()
                    : ContinueWithButton(
                        key: Keys.googleButtonKey,
                        onTap: () async {
                          /// Make sure to not directly being redirect in the Home Screen
                          context.read<AppBloc>().startingSelectionPhase();

                          /// Do the Google login and check if already present in the database
                          isAlreadySignedUp =
                              await context.read<AuthCubit>().logInWithGoogle();
                        },
                        namePlatform: SignInOption.google,
                      );
              },
            ),

            SizedBox(height: 16.h),

            /// Email and Password sign up
            ContinueWithButton(
              key: Keys.signUpButtonKey,
              onTap: () {
                Navigator.of(context).push(SignUpScreen.route());
              },
              namePlatform: SignInOption.email,
            ),

            SizedBox(height: 45.h),

            /// Email and Password sign in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${AppLocalizations.of(context)!.already_account} ",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                ViewClickableText(
                    key: Keys.signInButtonKey,
                    text: AppLocalizations.of(context)!.log_in,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontsWeight.semiBold,
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline),
                    onTap: () {
                      Navigator.of(context).push(SignInScreen.route());
                    }),
              ],
            ),

            const Spacer(),

            /// Policy Terms
            Text(
              AppLocalizations.of(context)!.policy_terms,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: UiConstants.authContentVPadding.h),
          ],
        ),
      ),
    );
  }
}
