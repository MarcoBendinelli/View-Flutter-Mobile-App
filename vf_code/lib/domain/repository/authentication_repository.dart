import 'dart:async';
import 'package:view_app/data/model/view_user.dart';

/// Abstract contract that defines the repository interface for managing user authentication.
///
/// This contract provides a set of methods and properties for performing authentication-related operations,
/// such as signing up, logging in, logging out, and retrieving user information.
abstract class AuthenticationRepository {
  /// Stream of [ViewUser] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [ViewUser.empty] if the user is not authenticated.
  Stream<ViewUser> get user;

  /// Returns the current cached user.
  /// Defaults to [ViewUser.empty] if there is no cached user.
  ViewUser get currentUser;

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> signUp({required String email, required String password});

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  ///
  /// Returns true if the user is already present in the database,
  /// false otherwise
  Future<bool> logInWithGoogle();

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Saves user information to the Firestore database.
  ///
  /// The method takes a [ViewUser] object as a parameter and checks whether the user is new or not.
  /// If the user is new, it also uploads the user's photo to the storage and saves the URL in the database.
  ///
  /// Returns true if the user is already present in the database,
  /// false otherwise
  Future<void> saveUserToDb({required ViewUser user});

  /// Sends a password reset email with the provided [email].
  ///
  /// Throws an [SendPasswordResetEmailFailure] if an exception occurs.
  Future<void> sendPasswordResetEmail({required String email});

  /// Signs out the current user which will emit
  /// [ViewUser.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut();
}
