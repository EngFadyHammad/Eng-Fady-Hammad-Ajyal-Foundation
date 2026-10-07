// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pro_task3/models/product.dart';
import 'package:pro_task3/widgets/product_widget.dart';

void main() {
  testWidgets('product quantity and numeric price display correctly', (
    WidgetTester tester,
  ) async {
    final firstProduct = Product(
      price: 1190.0,
      imagePath: 'images/image_1.png',
      name: 'First product',
      details: 'Size L',
      quantity: 0,
      size: 'L',
    );
    final secondProduct = Product(
      price: 1100.0,
      imagePath: 'images/image_2.png',
      name: 'Second product',
      details: 'Size M',
      quantity: 0,
      size: 'M',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView(
            children: [
              ProductWidget(product: firstProduct),
              ProductWidget(product: secondProduct),
            ],
          ),
        ),
      ),
    );

    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('\$ 1,190'), findsOneWidget);
    expect(find.text('\$ 1,100'), findsOneWidget);
    expect(
      tester.widget<IconButton>(find.byType(IconButton).first).onPressed,
      isNull,
    );

    await tester.tap(find.byIcon(Icons.add).first);
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove).first);
    await tester.pump();
    expect(find.text('0'), findsNWidgets(2));

    expect(firstProduct.quantity, 0);
    expect(secondProduct.quantity, 0);
  });
}
