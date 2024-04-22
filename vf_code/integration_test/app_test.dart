import 'package:flutter/cupertino.dart';
import 'package:view_app/core/keys.dart';
import 'package:view_app/presentation/first_user_selection/first_user_selection.dart';
import 'package:view_app/presentation/forgot_password/forgot_password.dart';
import 'package:view_app/presentation/home/home.dart';
import 'package:view_app/presentation/sign_in/sign_in.dart';

import 'main_test.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('end to end test', (tester) async {
    await app.mainTest();
    await tester.pumpAndSettle();

    await createAccount(tester);
    await navigationBarScreen(tester);
    await addPost(tester);
    await visualizePostAndUser(tester);

    await logout(tester);
    await resetPassword(tester);
    await login(tester);
  });
}

Future<void> createAccount(WidgetTester tester) async {
  debugPrint("Create account...");
  await tester.tap(find.byKey(Keys.signUpButtonKey));
  await tester.pumpAndSettle();
  await tester.enterText(
      find.byKey(Keys.signUpEmailInputKey), "test@test.test");
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(Keys.signUpPasswordInputKey), "test123");
  await tester.pumpAndSettle();
  await tester.enterText(
      find.byKey(Keys.signUpConfirmedPasswordInputKey), "test123");
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.signUpFormButtonKey));
  await tester.pumpAndSettle();
  expect(find.byType(TopicSelectionScreen), findsOneWidget);

  await tester.tap(find.byKey(Keys.topicKey("Music")));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.topicSelectionContinueKey));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.userSelectionSkipKey));
  await tester.pumpAndSettle();
  expect(find.byType(HomeScreen), findsOneWidget);
  await tester.pumpAndSettle();
}

Future<void> navigationBarScreen(WidgetTester tester) async {
  await tester.tap(find.byKey(Keys.homeNavBarButtonKey));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.searchNavBarButtonKey));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.bookmarksNavBarButtonKey));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.settingsNavBarButtonKey));
  await tester.pumpAndSettle();
}

Future<void> addPost(WidgetTester tester) async {
  await tester.tap(find.byKey(Keys.addPostButtonKey));
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(Keys.addPostTitleKey),
      "this is the title of the example post");
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(Keys.addPostSubtitleKey),
      "this is the subtitle of the example post");
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(Keys.addPostBodyKey),
      """this is the body of the example Post with more words to have the possibility
      to publish the post because it is not too much short""");
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.addPostPublishNow));
  await tester.pumpAndSettle();
}

Future<void> visualizePostAndUser(WidgetTester tester) async {
  await tester.tap(find.byKey(Keys.homeNavBarButtonKey));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.homeAvatarButtonKey));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.postKey(0)));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.backIconKey));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.backIconKey));
  await tester.pumpAndSettle();
}

Future<void> logout(WidgetTester tester) async {
  await tester.tap(find.byKey(Keys.settingsNavBarButtonKey));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.logoutKey));
  await tester.pumpAndSettle();
}

Future<void> resetPassword(WidgetTester tester) async {
  await tester.tap(find.byKey(Keys.signInButtonKey));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.signInForgotPasswordButtonKey));
  await tester.pumpAndSettle();
  expect(find.byType(ForgotPasswordScreen), findsOneWidget);
  await tester.enterText(
      find.byKey(Keys.forgotPasswordEmailInputKey), "asd@dfg.org");
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.forgotPasswordResetButton));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.emailSentBackButtonKey));
  await tester.pumpAndSettle();
  expect(find.byType(SignInScreen), findsOneWidget);
  await tester.tap(find.byKey(Keys.backIconKey));
  await tester.pumpAndSettle();
}

Future<void> login(WidgetTester tester) async {
  await tester.tap(find.byKey(Keys.signInButtonKey));
  await tester.pumpAndSettle();
  await tester.enterText(
      find.byKey(Keys.signInEmailInputKey), "test@test.test");
  await tester.pumpAndSettle();
  await tester.enterText(find.byKey(Keys.signInPasswordInputKey), "test123");
  await tester.pumpAndSettle();
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Keys.signInFormButtonKey));
  await tester.pumpAndSettle();
  expect(find.byType(HomeScreen), findsOneWidget);
}
