import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/domain/auth_firebase_exceptions.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/form_inputs/email.dart';
import 'package:view_app/domain/form_inputs/password.dart';

part 'sign_in_state.dart';

part 'sign_in_cubit.freezed.dart';

/// The [SignInCubit] is responsible for managing the [LoginState] of the form.
/// It exposes APIs to
///   - logInWithCredentials,
///   - logInWithGoogle,
///   - get notified when the email/password are updated.
/// The SignInCubit has a dependency on the AuthenticationRepository
/// in order to sign the user in either via credentials or via google sign in.
class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required AuthenticationRepository authenticationRepository,
    required String emailNotBlankMessage,
    required String invalidEmailMessage,
    required String tooShortPasswordMessage,
    required String missingLetterOrDigitMessage,
  })  : _authenticationRepository = authenticationRepository,
        _emailNotBlankMessage = emailNotBlankMessage,
        _invalidEmailMessage = invalidEmailMessage,
        _tooShortPasswordMessage = tooShortPasswordMessage,
        _missingLetterOrDigitMessage = missingLetterOrDigitMessage,
        super(const SignInState());

  final AuthenticationRepository _authenticationRepository;
  final String _emailNotBlankMessage;
  final String _invalidEmailMessage;
  final String _tooShortPasswordMessage;
  final String _missingLetterOrDigitMessage;

  /// Handles the change in the email input field.
  ///
  /// Updates the [SignInState] with the new email value and validates the entire form.
  void emailChanged(String value) {
    final email = Email.dirty(value);
    String validationError;

    if (email.error is BlankEmail) {
      validationError = _emailNotBlankMessage;
    } else if (email.error is InvalidEmail) {
      validationError = _invalidEmailMessage;
    } else {
      validationError = "";
    }

    emit(
      state.copyWith(
          email: email,
          isValid: Formz.validate([email, state.password]),
          emailValidationMessage: validationError),
    );
  }

  /// Handles the change in the password input field.
  ///
  /// Updates the [SignInState] with the new password value, validates the entire form,
  /// and provides feedback on password validation errors.
  void passwordChanged(String value) {
    final password = Password.dirty(value);
    String validationError;

    if (password.error is TooShortPassword) {
      validationError = _tooShortPasswordMessage;
    } else if (password.error is MissingLetterOrDigitPassword) {
      validationError = _missingLetterOrDigitMessage;
    } else {
      validationError = '';
    }

    emit(
      state.copyWith(
          password: password,
          isValid: Formz.validate([state.email, password]),
          passwordValidationMessage: validationError),
    );
  }

  /// Initiates the sign-in process with the provided email and password.
  ///
  /// If the form is valid, it attempts to log in using the provided credentials.
  /// Depending on the authentication result, the state is updated accordingly.
  Future<void> logInWithCredentials() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
