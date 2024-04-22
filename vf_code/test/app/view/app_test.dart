import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/app/app.dart';
import 'package:view_app/app/bloc/app_event.dart';
import 'package:view_app/app/bloc/app_state.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/domain/repository/authentication_repository.dart';
import 'package:view_app/domain/repository/post_repository.dart';
import 'package:view_app/di/injector.dart';
import 'package:view_app/presentation/auth/view/auth_screen.dart';
import 'package:view_app/presentation/home/home.dart';

import '../../utils/utils.dart';

class MockUser extends Mock implements ViewUser {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockPostRepository extends Mock implements PostRepository {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

/// This test file contains unit tests for the [App] and [AppView] classes in the application:
///
///   1. Navigates to AuthScreen when unauthenticated.
///   2. Navigates to HomeScreen when authenticated.
///
/// The tests use mocked instances for AuthenticationRepository, User, and AppBloc to simulate
/// different states of the authentication process and ensure the correct navigation behavior.
void main() {
  group('AppView', () {
    late AuthenticationRepository mockAuthRepository;
    late PostRepository mockPostRepository;
    late ViewUser user;
    late AppBloc appBloc;

    setUp(() {
      mockAuthRepository = MockAuthenticationRepository();
      mockPostRepository = MockPostRepository();
      appBloc = MockAppBloc();
      user = MockTests.userTest;
      when(() => mockAuthRepository.user).thenAnswer(
        (_) => const Stream.empty(),
      );
      when(() => mockPostRepository.getFollowingPosts(
          numOfPostsToDisplay: any(named: 'numOfPostsToDisplay'))).thenAnswer(
        (_) => Stream.value([]),
      );
      when(() => mockPostRepository.getForYouPosts(
          numOfPostsToDisplay: any(named: 'numOfPostsToDisplay'),
          filter: any(named: 'filter'))).thenAnswer(
        (_) => Stream.value([]),
      );
      when(() => mockPostRepository.getTrendingNowPosts()).thenAnswer(
        (_) => Stream.value([]),
      );
      when(() => appBloc.startingSelectionPhase()).thenAnswer((_) {});
      when(() => appBloc.selectionPhaseEnded()).thenAnswer((_) {});
      when(() => appBloc.state).thenAnswer((_) {
        return AppState.initial();
      });
      when(() => mockAuthRepository.currentUser).thenReturn(ViewUser.empty);
    });

    testWidgets('navigates to AuthScreen when unauthenticated', (tester) async {
      when(() => appBloc.state).thenReturn(AppState.initial());
      await tester.pumpWidget(
        getRouterTestApp(
            authRepository: mockAuthRepository,
            appBloc: AppBloc(authenticationRepository: mockAuthRepository)),
      );
      await tester.pumpAndSettle();
      expect(find.byType(AuthScreen), findsOneWidget);
    });

    testWidgets('navigates to HomeScreen when authenticated', (tester) async {
      getIt.registerSingleton<PostRepository>(mockPostRepository);
      when(() => mockAuthRepository.currentUser).thenReturn(user);
      when(() => appBloc.state).thenReturn(AppState.authenticated(user: user));
      await tester.pumpWidget(
        getRouterTestApp(
            authRepository: mockAuthRepository,
            appBloc: AppBloc(authenticationRepository: mockAuthRepository)),
      );
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
