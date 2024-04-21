import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

/// Module for dependency injection using `injectable`.
///
/// This module declares and provides singleton instances of third parties dependencies
/// required by the application, making them available for injection
/// into other classes and components.
@module
abstract class AppModule {
  /// Provides a [singleton] instance of [firebase_auth.FirebaseAuth].
  ///
  /// The [firebase_auth.FirebaseAuth] is used for user authentication in
  /// the application. This method is annotated with `@singleton` to
  /// ensure that only one instance of [firebase_auth.FirebaseAuth] is created
  /// and shared throughout the application.
  @singleton
  firebase_auth.FirebaseAuth provideFirebaseAuth() =>
      firebase_auth.FirebaseAuth.instance;

  /// Provides a [singleton] instance of [GoogleSignIn].
  ///
  /// The [GoogleSignIn] is used for handling Google Sign-In functionality
  /// in the application. This method is annotated with `@singleton` to
  /// ensure that only one instance of [GoogleSignIn] is created and shared
  /// throughout the application.
  @singleton
  GoogleSignIn provideGoogleSignIn() => GoogleSignIn.standard();

  /// Provides a [singleton] instance of [FirebaseFirestore].
  ///
  /// The [FirebaseFirestore] instance is used for interacting with the
  /// Cloud Firestore database in the application.
  @singleton
  FirebaseFirestore provideFirebaseFirestore() => FirebaseFirestore.instance;

  /// Provides a [singleton] instance of [FirebaseStorage].
  ///
  /// The [FirebaseStorage] instance is used for handling file storage in
  /// the application, such as uploading and downloading files.
  @singleton
  FirebaseStorage provideFirebaseStorage() => FirebaseStorage.instance;
}
