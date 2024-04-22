import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/domain/auth_firebase_exceptions.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/form_inputs/email.dart';

part 'forgot_password_state.dart';

part 'forgot_password_cubit.freezed.dart';

/// The [ForgotPasswordCubit] is responsible for managing the state of the "Reset Password" feature.
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({
    required AuthenticationRepository authenticationRepository,
    required String notBlankMessage,
    required String invalidEmailMessage,
  })  : _authenticationRepository = authenticationRepository,
        _notBlankMessage = notBlankMessage,
        _invalidEmailMessage = invalidEmailMessage,
        super(const ForgotPasswordState());

  final AuthenticationRepository _authenticationRepository;
  final String _notBlankMessage;
  final String _invalidEmailMessage;

  /// Handles the change in the email input field.
  ///
  /// Updates the [SignInState] with the new email value and validates the email.
  void emailChanged(String value) {
    final email = Email.dirty(value);
    String validationError;

    if (email.error is BlankEmail) {
      validationError = _notBlankMessage;
    } else if (email.error is InvalidEmail) {
      validationError = _invalidEmailMessage;
    } else {
      validationError = '';
    }

    emit(
      state.copyWith(
          email: email,
          isValid: Formz.validate([email]),
          validationMessage: validationError),
    );
  }

  /// Initiates the process of sending a reset password email.
  ///
  /// If the form is valid, it triggers the authentication repository's
  /// method and updates the state based on the outcome (success or failure).
  Future<void> sendPasswordResetEmail() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.sendPasswordResetEmail(
        email: state.email.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on SendPasswordResetEmailFailure catch (e) {
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
