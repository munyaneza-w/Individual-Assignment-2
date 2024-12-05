import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:where_am_i/main.dart';

void main() {
  group('Widget Tests for Where Am I App', () {
    // Test to check if the home screen renders correctly
    testWidgets('Home screen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.text('Africa'), findsOneWidget);
      expect(find.text('America'), findsOneWidget);
      expect(find.text('Asia'), findsOneWidget);
      expect(find.text('Europe'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(4));
    });

    // Reusable function for testing navigation to a specific region
    void testRegionNavigation(String region) {
      testWidgets('Navigation to $region screen works',
          (WidgetTester tester) async {
        await tester.pumpWidget(MyApp());

        // Tap on the region button.
        await tester.tap(find.text(region));
        await tester.pumpAndSettle();

        // Verify that the RegionScreen for the selected region is displayed.
        expect(find.text(region), findsOneWidget);
        expect(find.text("Your Current Location in $region:"), findsOneWidget);
      });
    }

    // Using the reusable test function for each region
    testRegionNavigation('Africa');
    testRegionNavigation('Europe');
    testRegionNavigation('Asia');
    testRegionNavigation('America');
  });
}
