// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
// import 'package:injectable/injectable.dart';
//
// /// Module for dependency injection using `injectable`.
// ///
// /// This module declares and provides singleton instances of third parties dependencies
// /// required by the application, making them available for injection
// /// into other classes and components.
// @module
// abstract class AppModule {
//   @singleton
//   firebase_auth.FirebaseAuth provideFirebaseAuth() => MockFirebaseAuth();
//
//   @singleton
//   GoogleSignIn provideGoogleSignIn() => MockGoogleSignIn();
//
//   @singleton
//   FirebaseFirestore provideFirebaseFirestore() => FakeFirebaseFirestore();
//
//   @singleton
//   FirebaseStorage provideFirebaseStorage() => MockFirebaseStorage();
// }
