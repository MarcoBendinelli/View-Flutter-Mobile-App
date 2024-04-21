import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/domain/auth_firebase_exceptions.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/form_inputs/confirmed_password.dart';
import 'package:view_app/domain/form_inputs/email.dart';
import 'package:view_app/domain/form_inputs/password.dart';

part 'sign_up_state.dart';

part 'sign_up_cubit.freezed.dart';

/// The [SignUpCubit] manages the state of the [SignUpForm] and
/// communicates with the AuthenticationRepository in order to create
/// new user accounts.
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required AuthenticationRepository authenticationRepository,
    required String emailNotBlankMessage,
    required String invalidEmailMessage,
    required String shortPasswordMessage,
    required String passwordLetterOrDigitPassword,
    required String passwordsNotMatch,
  })  : _authenticationRepository = authenticationRepository,
        _emailNotBlankMessage = emailNotBlankMessage,
        _invalidEmailMessage = invalidEmailMessage,
        _shortPasswordMessage = shortPasswordMessage,
        _passwordLetterOrDigitPasswordMessage = passwordLetterOrDigitPassword,
        _passwordsNotMatchMessage = passwordsNotMatch,
        super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;
  final String _emailNotBlankMessage;
  final String _invalidEmailMessage;
  final String _shortPasswordMessage;
  final String _passwordLetterOrDigitPasswordMessage;
  final String _passwordsNotMatchMessage;

  /// Handles changes to the email input field.
  ///
  /// Updates the state with the provided email value and triggers validation for
  /// the entire form, including the password and confirmed password fields.
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
          isValid:
              Formz.validate([email, state.password, state.confirmedPassword]),
          emailValidationMessage: validationError),
    );
  }

  /// Handles changes to the password input field.
  ///
  /// Updates the state with the provided password value, recalculates the validity
  /// of the entire form, and triggers validation for the confirmed password field.
  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );

    String validationError;
    String confirmedPasswordValidationError;

    if (password.error is TooShortPassword) {
      validationError = _shortPasswordMessage;
    } else if (password.error is MissingLetterOrDigitPassword) {
      validationError = _passwordLetterOrDigitPasswordMessage;
    } else {
      validationError = '';
    }

    if (confirmedPassword.error != null) {
      confirmedPasswordValidationError = _passwordsNotMatchMessage;
    } else {
      confirmedPasswordValidationError = '';
    }

    emit(
      state.copyWith(
          password: password,
          confirmedPassword: confirmedPassword,
          isValid: Formz.validate([
            state.email,
            password,
            confirmedPassword,
          ]),
          passwordValidationMessage: validationError,
          confirmedPasswordValidationMessage: confirmedPasswordValidationError),
    );
  }

  /// Handles changes to the confirmed password input field.
  ///
  /// Updates the state with the provided confirmed password value and recalculates
  /// the validity of the entire form.
  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );

    String validationRepeatedPasswordError;

    if (confirmedPassword.error != null) {
      validationRepeatedPasswordError = _passwordsNotMatchMessage;
    } else {
      validationRepeatedPasswordError = '';
    }

    emit(
      state.copyWith(
          confirmedPassword: confirmedPassword,
          isValid: Formz.validate([
            state.email,
            state.password,
            confirmedPassword,
          ]),
          confirmedPasswordValidationMessage: validationRepeatedPasswordError),
    );
  }

  /// Initiates the sign-up process when the form is submitted.
  ///
  /// If the form is valid, it triggers the authentication repository's sign-up
  /// method and updates the state based on the outcome (success or failure).
  Future<void> signUpFormSubmitted() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
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
