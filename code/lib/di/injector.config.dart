// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import '../data/cache/view_user_cache.dart' as _i9;
import '../data/repository/authentication_repository_impl.dart' as _i11;
import '../data/repository/first_user_selection_repository_impl.dart' as _i13;
import '../data/repository/post_repository_impl.dart' as _i8;
import '../data/repository/user_profile_repository_impl.dart' as _i15;
import '../domain/repository/authentication_repository.dart' as _i10;
import '../domain/repository/first_user_selection_repository.dart' as _i12;
import '../domain/repository/post_repository.dart' as _i7;
import '../domain/repository/user_profile_repository.dart' as _i14;
import 'app_module.dart' as _i16;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singleton<_i3.FirebaseAuth>(appModule.provideFirebaseAuth());
  gh.singleton<_i4.FirebaseFirestore>(appModule.provideFirebaseFirestore());
  gh.singleton<_i5.FirebaseStorage>(appModule.provideFirebaseStorage());
  gh.singleton<_i6.GoogleSignIn>(appModule.provideGoogleSignIn());
  gh.factory<_i7.PostRepository>(() => _i8.PostRepositoryImpl(
        firebaseFirestore: gh<_i4.FirebaseFirestore>(),
        firebaseAuth: gh<_i3.FirebaseAuth>(),
        firebaseStorage: gh<_i5.FirebaseStorage>(),
      ));
  gh.lazySingleton<_i9.ViewUserCache>(() => _i9.ViewUserCache());
  gh.factory<_i10.AuthenticationRepository>(
      () => _i11.AuthenticationRepositoryImpl(
            viewUserCache: gh<_i9.ViewUserCache>(),
            firebaseFirestore: gh<_i4.FirebaseFirestore>(),
            firebaseStorage: gh<_i5.FirebaseStorage>(),
            firebaseAuth: gh<_i3.FirebaseAuth>(),
            googleSignIn: gh<_i6.GoogleSignIn>(),
          ));
  gh.factory<_i12.FirstUserSelectionRepository>(
      () => _i13.FirstUserSelectionRepositoryImpl(
            viewUserCache: gh<_i9.ViewUserCache>(),
            firebaseAuth: gh<_i3.FirebaseAuth>(),
            firebaseFirestore: gh<_i4.FirebaseFirestore>(),
            topicsFromArb: gh<String>(),
          ));
  gh.factory<_i14.UserProfileRepository>(() => _i15.UserProfileRepositoryImpl(
        viewUserCache: gh<_i9.ViewUserCache>(),
        firebaseFirestore: gh<_i4.FirebaseFirestore>(),
        firebaseAuth: gh<_i3.FirebaseAuth>(),
        firebaseStorage: gh<_i5.FirebaseStorage>(),
      ));
  return getIt;
}

class _$AppModule extends _i16.AppModule {}
