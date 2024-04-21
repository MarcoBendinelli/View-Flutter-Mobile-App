import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/app/bloc/app_bloc.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/form_inputs/form_inputs.dart';
import 'package:view_app/presentation/email_sent/view/email_sent_screen.dart';
import 'package:view_app/presentation/forgot_password/forgot_password.dart';
import 'package:view_app/presentation/widgets/widgets.dart';
import 'package:view_app/core/keys.dart';

import '../../../utils/utils.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockForgotPasswordCubit extends MockCubit<ForgotPasswordState>
    implements ForgotPasswordCubit {}

class MockEmail extends Mock implements Email {}

/// This test file contains unit tests for the [SignInForm] widget:
///
///   1. Ensuring that [emailChanged] is called when the email changes.
///   3. Ensuring that [sendPasswordResetEmail] is called when the login button is pressed.
///   4. Rendering a [SendPasswordResetEmailFailure] SnackBar when submission fails.
///   5. Displaying invalid email error text when the email is invalid.
///   6. Disabling/Enabling the reset button when the status is validated/not validated.
///   7. Navigating to [EmailSentScreen] when the reset email is sent.
void main() {
  const testEmail = 'test@gmail.com';

  group('ForgotPasswordContent', () {
    late ForgotPasswordCubit forgotPasswordCubit;
    late AuthenticationRepository mockAuthRepository;
    late AppBloc appBloc;

    setUp(() {
      forgotPasswordCubit = MockForgotPasswordCubit();
      mockAuthRepository = MockAuthenticationRepository();
      when(() => forgotPasswordCubit.state)
          .thenReturn(const ForgotPasswordState());
      when(() => forgotPasswordCubit.sendPasswordResetEmail())
          .thenAnswer((_) async {});
    });

    group('calls', () {
      testWidgets('emailChanged when email changes', (tester) async {
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: forgotPasswordCubit,
              child: const ForgotPasswordContent(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.enterText(
            find.byKey(Keys.forgotPasswordEmailInputKey), testEmail);
        verify(() => forgotPasswordCubit.emailChanged(testEmail)).called(1);
      });

      testWidgets('sendPasswordResetEmail when reset button is pressed',
          (tester) async {
        when(() => forgotPasswordCubit.state).thenReturn(
          const ForgotPasswordState(isValid: true),
        );
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: forgotPasswordCubit,
              child: const ForgotPasswordContent(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Keys.forgotPasswordResetButton));
        verify(() => forgotPasswordCubit.sendPasswordResetEmail()).called(1);
      });
    });

    group('renders', () {
      testWidgets(
          'sendPasswordResetEmailFailure SnackBar when submission fails',
          (tester) async {
        whenListen(
          forgotPasswordCubit,
          Stream.fromIterable(const <ForgotPasswordState>[
            ForgotPasswordState(status: FormzSubmissionStatus.inProgress),
            ForgotPasswordState(status: FormzSubmissionStatus.failure),
          ]),
        );
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: forgotPasswordCubit,
              child: const ForgotPasswordContent(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        await tester.pump();
        expect(find.text('An error occurred'), findsOneWidget);
      });

      testWidgets('invalid email error text when email is invalid',
          (tester) async {
        final email = MockEmail();
        when(() => email.isPure).thenReturn(false);
        when(() => email.error).thenReturn(BlankEmail());
        when(() => forgotPasswordCubit.state).thenReturn(ForgotPasswordState(
            email: email, validationMessage: 'Email cannot be blank'));
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: forgotPasswordCubit,
              child: const ForgotPasswordContent(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        expect(find.text('Email cannot be blank'), findsOneWidget);
      });

      testWidgets('disabled reset button when status is not validated',
          (tester) async {
        when(() => forgotPasswordCubit.state)
            .thenReturn(const ForgotPasswordState());
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: forgotPasswordCubit,
              child: const ForgotPasswordContent(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        final resetButton = tester.widget<ViewTextButton>(
          find.byKey(Keys.forgotPasswordResetButton),
        );
        expect(resetButton.enabled, isFalse);
      });

      testWidgets('enabled reset button when status is validated',
          (tester) async {
        when(() => forgotPasswordCubit.state).thenReturn(
          const ForgotPasswordState(isValid: true),
        );
        await tester.pumpWidget(
          getTestApp(
              homeTestApp: Scaffold(
            body: BlocProvider.value(
              value: forgotPasswordCubit,
              child: const ForgotPasswordContent(),
            ),
          )),
        );
        await tester.pumpAndSettle();
        final resetButton = tester.widget<ViewTextButton>(
          find.byKey(Keys.forgotPasswordResetButton),
        );
        expect(resetButton.enabled, isTrue);
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

      testWidgets('to EmailSentScreen when reset email is sent',
          (tester) async {
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
        expect(find.byType(ForgotPasswordScreen), findsOneWidget);
        await tester.enterText(
            find.byKey(Keys.forgotPasswordEmailInputKey), testEmail);
        await tester.pumpAndSettle();
        // Press the reset button
        await tester.tap(find.byKey(Keys.forgotPasswordResetButton));
        await tester.pumpAndSettle();
        expect(find.byType(EmailSentScreen), findsOneWidget);
      });
    });
  });
}
