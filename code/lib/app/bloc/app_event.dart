import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:view_app/data/model/view_user.dart';

part 'app_event.freezed.dart';

/// Represents events that can be processed by the [AppBloc].
@freezed
class AppEvent with _$AppEvent {
  /// It notifies the bloc that the current user has requested to be logged out.
  const factory AppEvent.logoutRequested() = RequestLogout;

  /// It notifies the bloc that the current user has changed.
  const factory AppEvent.userChanged({required ViewUser user}) = LoadUserChanged;

  /// It notifies the bloc that the selection phase is ended and
  /// the current user must be loaded.
  const factory AppEvent.loadUser() = LoadUser;

  /// It notifies the bloc that the current user has to do the first selection phase.
  const factory AppEvent.userFirstSelection() = LoadFirstSelection;
}
