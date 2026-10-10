// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vyom/main.dart';
import 'package:vyom/page1.dart';

void main() {
  testWidgets('Vyom app loads welcome screen', (WidgetTester tester) async {
    await tester.pumpWidget(const VyomApp());

    expect(find.byType(WelcomePage), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(2));
  });
}
