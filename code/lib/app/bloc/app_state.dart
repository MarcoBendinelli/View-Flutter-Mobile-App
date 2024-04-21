import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/data/model/view_user.dart';

part 'app_state.freezed.dart';

/// Enum representing the different states of the application's authentication status.
enum AppStatus { authenticated, unauthenticated, firstSelection }

/// Represents the state of the application, including authentication status and user information.
///
/// It is an immutable data class that represents the state of the application.
/// It includes an [AppStatus] indicating whether the user is authenticated or unauthenticated,
/// and an optional [ViewUser] object containing user information.
@freezed
class AppState with _$AppState {
  factory AppState({
    required AppStatus status,
    required ViewUser user,
  }) = _appState;

  factory AppState.initial() =>
      AppState(status: AppStatus.unauthenticated, user: ViewUser.empty);

  factory AppState.authenticated({required ViewUser user}) =>
      AppState(status: AppStatus.authenticated, user: user);
}
