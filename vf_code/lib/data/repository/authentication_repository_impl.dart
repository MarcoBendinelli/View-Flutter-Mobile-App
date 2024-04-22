library authentication_repository;

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:view_app/core/constants.dart';
import 'package:view_app/data/cache/view_user_cache.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/auth_firebase_exceptions.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';

/// Repository which manages user authentication.
@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required ViewUserCache viewUserCache,
    required FirebaseFirestore firebaseFirestore,
    required FirebaseStorage firebaseStorage,
    required firebase_auth.FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _viewUserCache = viewUserCache,
        _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _firestore = firebaseFirestore,
        _firebaseStorage = firebaseStorage;

  final ViewUserCache _viewUserCache;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  /// Whether or not the current environment is web
  /// Should only be overridden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  @override
  Stream<ViewUser> get user {
    return _firebaseAuth.authStateChanges().asyncMap(_userFromFirebaseUser);
  }

  /// Converts a Firebase [User] to an updated [ViewUser] object by retrieving
  /// user data from Firestore.
  ///
  /// #### Parameters:
  /// - [firebaseUser] : The Firebase user object to be converted.
  ///
  /// Returns a [ViewUser] object representing the user.
  Future<ViewUser> _userFromFirebaseUser(User? firebaseUser) async {
    ViewUser user;

    // If the Firebase user is null, return an empty user.
    if (firebaseUser == null) {
      user = ViewUser.empty;
    } else {
      // Retrieve the user document reference from Firestore.
      final userDocRef = _firestore
          .collection(Constants.usersCollection)
          .doc(firebaseUser.uid);

      final docSnapshot = await userDocRef.get();

      // If the user document exists, create a [ViewUser] from the snapshot.
      if (docSnapshot.exists) {
        user = ViewUser.fromFirestore(docSnapshot, null);
      } else {
        // If the user document doesn't exist, create a new [ViewUser] with default values.
        user = ViewUser(
            id: firebaseUser.uid,
            email: firebaseUser.email!,
            username: firebaseUser.displayName ?? firebaseUser.email!,
            profession: '',
            photoUrl: firebaseUser.photoURL ?? '',
            topics: const [],
            following: const [],
            followers: const [],
            createdAt: Timestamp.now());
      }
    }
    // Cache the user data and return the user.
    _viewUserCache.write(value: user);
    return user;
  }

  @override
  ViewUser get currentUser {
    return _viewUserCache.read();
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      // Get the user data
      final userData = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Save it to Firestore
      saveUserToDb(
          user: ViewUser(
        id: userData.user!.uid,
        email: userData.user!.email!,
        username: userData.user!.displayName ?? userData.user!.email!,
        profession: Constants.usersProfessionDefault,
        photoUrl: userData.user!.photoURL ?? '',
        topics: const [],
        following: const [],
        followers: const [],
        createdAt: Timestamp.now(),
      ));
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<bool> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }
      // Get the user data
      final userData = await _firebaseAuth.signInWithCredential(credential);
      // Save it to Firestore and return true/false if already/not already present
      return saveUserToDb(
          user: ViewUser(
        id: userData.user!.uid,
        email: userData.user!.email!,
        username: userData.user!.displayName ?? userData.user!.email!,
        profession: Constants.usersProfessionDefault,
        photoUrl: userData.user!.photoURL ?? '',
        topics: const [],
        following: const [],
        followers: const [],
        createdAt: Timestamp.now(),
      ));
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<bool> saveUserToDb({required ViewUser user}) async {
    final userDocRef = _firestore
        .collection(Constants.usersCollection)
        .doc(user.id)
        .withConverter(
            fromFirestore: ViewUser.fromFirestore,
            toFirestore: (ViewUser user, options) => user.toMap());
    final doc = await userDocRef.get();

    if (doc.exists) {
      debugPrint('......logging existing user.......');
      return true;
    } else {
      await userDocRef.set(user);
      debugPrint('......saved new user data.......');
      return false;
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SendPasswordResetEmailFailure.fromCode(e.code);
    } catch (_) {
      throw const SendPasswordResetEmailFailure();
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}
