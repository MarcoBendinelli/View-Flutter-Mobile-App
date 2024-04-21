import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';

import 'app_event.dart';
import 'app_state.dart';

/// The [AppBloc] is responsible for managing the global state of the application.
///
/// The [AppBloc] manages the authentication state by subscribing to the user stream
/// from the [AuthenticationRepository] in order to emit new states
/// in response to changes in the current user.
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(
                  user: authenticationRepository.currentUser)
              : AppState.initial(),
        ) {
    // Register event handlers for internal events.
    on<AppEvent>((events, emit) async {
      await events.map(
        logoutRequested: (event) async => _onLogoutRequested(event, emit),
        userChanged: (event) async => _onUserChanged(event, emit),
        loadUser: (event) async => _onLoadUser(event, emit),
        userFirstSelection: (event) async => _onUserFirstSelection(event, emit),
      );
    });

    /// Subscribe to the user stream from the AuthenticationRepository.
    /// Adds an [_AppUserChanged] event internally to process changes in the current user
    /// if he/she completes the selection phase
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(LoadUserChanged(user: user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<ViewUser> _userSubscription;
  bool _selectionPending = false;

  /// Handles the [LoadUserChanged] event and emits a new [AppState] accordingly.
  void _onUserChanged(LoadUserChanged event, Emitter<AppState> emit) {
    /// Allow the users doing the selection
    if (_selectionPending) {
      return;
    }
    emit(
      event.user.isNotEmpty
          ? AppState.authenticated(user: event.user)
          : AppState.initial(),
    );
  }

  /// Handles the [RequestLogout] event by initiating the logout process.
  void _onLogoutRequested(RequestLogout event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  /// Handles the [LoadFirstSelection] event.
  void _onUserFirstSelection(LoadFirstSelection event, Emitter<AppState> emit) {
    emit(state.copyWith(
      status: AppStatus.firstSelection
    ));
  }

  /// Handles the [LoadUser] event.
  void _onLoadUser(LoadUser event, Emitter<AppState> emit) {
    emit(AppState.authenticated(user: _authenticationRepository.currentUser));
  }

  /// Methods for tracking the selection phase, enabling users to make
  /// their selections without being automatically redirected
  /// to the Home Screen immediately after signing up.

  void get selectionPending => _selectionPending;

  void startingSelectionPhase() => _selectionPending = true;

  void selectionPhaseEnded() => _selectionPending = false;

  /// Cancel the user stream subscription when the bloc is closed.
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
