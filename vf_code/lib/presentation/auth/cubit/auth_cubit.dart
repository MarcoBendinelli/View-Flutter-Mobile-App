import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/domain/auth_firebase_exceptions.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

/// The [AuthCubit] class provides methods to perform authentication-related actions
/// such as logging in with Google.
class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository _authenticationRepository;

  AuthCubit(this._authenticationRepository) : super(const AuthState());

  /// Initiates the Google login process.
  ///
  /// Emits state changes based on the success or failure of the login attempt.
  Future<bool> logInWithGoogle() async {
    bool alreadyPresent = false;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      // Attempt to log in with Google using the authentication repository
      // and check if the user is already present inside the database
      alreadyPresent = await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
    return alreadyPresent;
  }
}
