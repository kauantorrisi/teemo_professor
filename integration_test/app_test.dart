import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:teemo_professor/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('SummonerModule E2E Test', () {
    testWidgets('Pesquisar por Khons no TextField',
        (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('searchSummonerTextField')), 'Khons');

      await tester.pumpAndSettle();

      expect(find.text('Khons'), findsOneWidget);
    });
  });

  testWidgets('', (WidgetTester tester) async {});
}
