import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:view_app/core/utils.dart';

/// Test cases for the [Utils] class:
///
///   1. The test verifies that the [Utils.showErrorSnackBar] method
///   correctly displays a SnackBar with the specified message when triggered
///   by tapping an ElevatedButton.
void main() {
  testWidgets('Utils.showErrorSnackBar displays SnackBar',
      (WidgetTester tester) async {
    // Build a simple MaterialApp to provide a context
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  Utils.showErrorSnackBar(context, 'Hello tester!');
                },
                child: const Text('Press here tester!'),
              );
            },
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    // Tap the button to trigger the snackBar
    await tester.tap(find.text('Press here tester!'));
    await tester.pumpAndSettle();

    // Verify that the snackBar is displayed
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Hello tester!'), findsOneWidget);
  });
}
