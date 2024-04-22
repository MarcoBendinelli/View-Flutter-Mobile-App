import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:view_app/app/app.dart';
import 'package:view_app/app/bloc/app_event.dart';
import 'package:view_app/app/bloc/app_state.dart';
import 'package:view_app/data/model/view_user.dart';

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class MockUser extends Mock implements ViewUser {}

void main() {
  const logoutButtonKey = Key('homePage_logout_iconButton');
  group('HomeScreen', () {
    late AppBloc appBloc;
    late ViewUser user;

    setUp(() {
      appBloc = MockAppBloc();
      user = MockUser();
      when(() => user.email).thenReturn('test@gmail.com');
      when(() => appBloc.state).thenReturn(AppState.authenticated(user: user));
    });

    // group('calls', () {
    //   testWidgets('AppLogoutRequested when logout is pressed', (tester) async {
    //     await tester.pumpWidget(
    //       BlocProvider.value(
    //         value: appBloc,
    //         child: const MaterialApp(home: HomeScreen()),
    //       ),
    //     );
    //     await tester.tap(find.byKey(logoutButtonKey));
    //     verify(() => appBloc.add(const AppLogoutRequested())).called(1);
    //   });
    // });

    group('renders', () {
      // testWidgets('avatar widget', (tester) async {
      //   await tester.pumpWidget(
      //     ScreenUtilInit(
      //         designSize: const Size(
      //             Constants.prototypeWidth, Constants.prototypeHeight),
      //         builder: (_, __) {
      //           return getTestApp(
      //               homeTestApp: BlocProvider.value(
      //             value: appBloc,
      //             child: const HomeScreen(),
      //           ));
      //         }),
      //   );
      //   await tester.pumpAndSettle();
      //   expect(find.byType(ViewAvatar), findsOneWidget);
      // });

      // testWidgets('email address', (tester) async {
      //   await tester.pumpWidget(
      //     BlocProvider.value(
      //       value: appBloc,
      //       child: const MaterialApp(home: HomeScreen()),
      //     ),
      //   );
      //   expect(find.text('test@gmail.com'), findsOneWidget);
      // });
      //
      // testWidgets('name', (tester) async {
      //   when(() => user.name).thenReturn('Joe');
      //   await tester.pumpWidget(
      //     BlocProvider.value(
      //       value: appBloc,
      //       child: const MaterialApp(home: HomeScreen()),
      //     ),
      //   );
      //   expect(find.text('Joe'), findsOneWidget);
      // });
    });
  });
}
