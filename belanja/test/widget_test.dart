import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:belanja/pages/home_page.dart';

void main() {
  testWidgets('Shopping list shows items', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    expect(find.text('Sugar'), findsOneWidget);
    expect(find.text('Salt'), findsOneWidget);
  });
}