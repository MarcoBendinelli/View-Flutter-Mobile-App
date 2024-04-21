import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/presentation/email_sent/view/email_sent_screen.dart';
import 'package:view_app/presentation/sign_in/sign_in.dart';
import 'package:view_app/core/keys.dart';

import '../../../utils/utils.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

/// This test file contains unit tests for the [ForgotPasswordContent] widget:
///
///   1. Rendering the [EmailSentScreen] widgets correctly.
///   2. Navigating back to [SignInScreen] on clicking the back button from [EmailSentScreen].
void main() {
  const testEmail = 'test@gmail.com';

  group('ForgotPasswordContent', () {
    late AuthenticationRepository mockAuthRepository;
    late AppBloc appBloc;

    setUp(() {
      mockAuthRepository = MockAuthenticationRepository();
    });

    group('renders', () {
      testWidgets('the emailSentScreen widgets correctly', (tester) async {
        await tester.pumpWidget(
          getTestApp(
            homeTestApp: const EmailSentScreen(),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(SvgPicture), findsOneWidget);
        expect(find.byKey(Keys.emailSentBackButtonKey), findsOneWidget);
      });
    });

    group('navigates', () {
      setUp(() {
        when(() => mockAuthRepository.user).thenAnswer((_) {
          return Stream.fromIterable([ViewUser.empty]);
        });
        when(() => mockAuthRepository.currentUser).thenAnswer((_) {
          return ViewUser(
            id: "id",
            email: "email",
            username: '',
            profession: '',
            photoUrl: '',
            topics: const [],
            following: const [],
            followers: const [],
            createdAt: Timestamp(0, 0),
          );
        });
        when(() => mockAuthRepository.sendPasswordResetEmail(
            email: any(named: "email"))).thenAnswer((_) async {
          return;
        });
        appBloc = AppBloc(authenticationRepository: mockAuthRepository);
      });

      testWidgets('back to SignInScreen on click back button', (tester) async {
        await tester.pumpWidget(
          getRouterTestApp(
              authRepository: mockAuthRepository, appBloc: appBloc),
        );
        await tester.pumpAndSettle();
        // Go to the Sign In Screen
        await tester.tap(find.byKey(Keys.signInButtonKey));
        await tester.pumpAndSettle();
        // Go to the Forgot Password Screen
        await tester.tap(find.byKey(Keys.signInForgotPasswordButtonKey));
        await tester.pumpAndSettle();
        await tester.enterText(
            find.byKey(Keys.forgotPasswordEmailInputKey), testEmail);
        await tester.pumpAndSettle();
        // Reset the email
        await tester.tap(find.byKey(Keys.forgotPasswordResetButton));
        await tester.pumpAndSettle();
        expect(find.byType(EmailSentScreen), findsOneWidget);
        // Go back to the Sign In Screen
        await tester.tap(find.byKey(Keys.emailSentBackButtonKey));
        await tester.pumpAndSettle();
        expect(find.byType(SignInScreen), findsOneWidget);
      });
    });
  });
}
