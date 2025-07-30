import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pretty_good_spacing/pretty_good_spacing.dart';

void main() {
  group('Space', () {
    tearDown(() {
      // Reset the spacing system after each test
      Space.reset();
    });

    test('uses default spacing unit when not initialized', () {
      expect(Space.spacingUnit, 8.0);
      expect(Space.space100, 8.0);
      expect(Space.space200, 16.0);
      expect(Space.space050, 4.0);
    });

    test('can be initialized with custom spacing unit', () {
      Space.initialize(spacingUnit: 4.0);

      expect(Space.spacingUnit, 4.0);
      expect(Space.space100, 4.0);
      expect(Space.space200, 8.0);
      expect(Space.space050, 2.0);
    });

    test('calculates all spacing values correctly with custom unit', () {
      Space.initialize(spacingUnit: 10.0);

      expect(Space.space0, 0);
      expect(Space.space025, 2.5);
      expect(Space.space050, 5.0);
      expect(Space.space075, 7.5);
      expect(Space.space100, 10.0);
      expect(Space.space150, 15.0);
      expect(Space.space200, 20.0);
      expect(Space.space250, 25.0);
      expect(Space.space300, 30.0);
      expect(Space.space400, 40.0);
      expect(Space.space500, 50.0);
      expect(Space.space600, 60.0);
      expect(Space.space800, 80.0);
      expect(Space.space1000, 100.0);
    });

    test('throws error when initialized twice', () {
      Space.initialize(spacingUnit: 8.0);

      expect(
        () => Space.initialize(spacingUnit: 4.0),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            contains('Space has already been initialized'),
          ),
        ),
      );
    });

    test('throws error when spacing unit is zero or negative', () {
      expect(
        () => Space.initialize(spacingUnit: 0.0),
        throwsA(isA<ArgumentError>()),
      );

      expect(
        () => Space.initialize(spacingUnit: -1.0),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('extension methods work correctly', () {
      Space.initialize(spacingUnit: 8.0);

      final allPadding = Space.space100.all;
      expect(allPadding.left, 8.0);
      expect(allPadding.right, 8.0);
      expect(allPadding.top, 8.0);
      expect(allPadding.bottom, 8.0);

      final horizontalPadding = Space.space200.horizontal;
      expect(horizontalPadding.left, 16.0);
      expect(horizontalPadding.right, 16.0);
      expect(horizontalPadding.top, 0);
      expect(horizontalPadding.bottom, 0);

      final verticalPadding = Space.space150.vertical;
      expect(verticalPadding.left, 0);
      expect(verticalPadding.right, 0);
      expect(verticalPadding.top, 12.0);
      expect(verticalPadding.bottom, 12.0);
    });

    test('all EdgeInsets extension methods work correctly', () {
      Space.initialize(spacingUnit: 10.0);

      // Test individual sides
      expect(Space.space100.top, const EdgeInsets.only(top: 10.0));
      expect(Space.space100.bottom, const EdgeInsets.only(bottom: 10.0));
      expect(Space.space100.left, const EdgeInsets.only(left: 10.0));
      expect(Space.space100.right, const EdgeInsets.only(right: 10.0));

      // Test corner combinations
      expect(
        Space.space100.topLeft,
        const EdgeInsets.only(top: 10.0, left: 10.0),
      );
      expect(
        Space.space100.topRight,
        const EdgeInsets.only(top: 10.0, right: 10.0),
      );
      expect(
        Space.space100.bottomLeft,
        const EdgeInsets.only(bottom: 10.0, left: 10.0),
      );
      expect(
        Space.space100.bottomRight,
        const EdgeInsets.only(bottom: 10.0, right: 10.0),
      );
    });
  });

  group('KGap', () {
    tearDown(() {
      Space.reset();
    });

    testWidgets('creates gap with correct spacing value', (tester) async {
      Space.initialize(spacingUnit: 8.0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const Text('First'),
                KGap.space100(),
                const Text('Second'),
              ],
            ),
          ),
        ),
      );

      // Verify the widget builds without errors
      expect(find.byType(KGap), findsOneWidget);
      expect(find.text('First'), findsOneWidget);
      expect(find.text('Second'), findsOneWidget);
    });

    testWidgets('factory constructors create correct spacing', (tester) async {
      Space.initialize(spacingUnit: 10.0);

      const testCases = [
        (KGap.space0, 'space0'),
        (KGap.space025, 'space025'),
        (KGap.space050, 'space050'),
        (KGap.space075, 'space075'),
        (KGap.space100, 'space100'),
        (KGap.space150, 'space150'),
        (KGap.space200, 'space200'),
        (KGap.space250, 'space250'),
        (KGap.space300, 'space300'),
        (KGap.space400, 'space400'),
        (KGap.space500, 'space500'),
        (KGap.space600, 'space600'),
        (KGap.space800, 'space800'),
        (KGap.space1000, 'space1000'),
      ];

      for (final testCase in testCases) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(children: [const Text('Test'), testCase.$1()]),
            ),
          ),
        );

        expect(find.byType(KGap), findsOneWidget);
      }
    });

    testWidgets('supports crossAxisExtent parameter', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const Text('Before'),
                KGap.space100(crossAxisExtent: 50.0),
                const Text('After'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(KGap), findsOneWidget);
    });

    testWidgets('supports color parameter', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const Text('Before'),
                KGap.space100(color: Colors.red),
                const Text('After'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(KGap), findsOneWidget);
    });

    test('constructs with all parameters', () {
      const gap = KGap(space: 16.0, crossAxisExtent: 50.0, color: Colors.blue);

      expect(gap.space, 16.0);
      expect(gap.crossAxisExtent, 50.0);
      expect(gap.color, Colors.blue);
    });
  });
}
