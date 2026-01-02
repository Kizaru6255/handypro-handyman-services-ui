// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:handypro/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:handypro/core/localization/localization_setup.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        child: EasyLocalization(
          supportedLocales: LocalizationSetup.supportedLocales,
          path: LocalizationSetup.translationsPath,
          fallbackLocale: const Locale('en', 'US'),
          startLocale: const Locale('en', 'US'),
          child: const App(),
        ),
      ),
    );

    // Verify that app loads
    expect(find.byType(App), findsOneWidget);
  });
}
