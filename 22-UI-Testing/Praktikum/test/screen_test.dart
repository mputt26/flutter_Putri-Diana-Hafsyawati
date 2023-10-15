import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_layout/screen/main.dart';

void main() {
  testWidgets('Testing Prioritas2', (WidgetTester tester) async {
    await tester.pumpWidget(HelloWorld());

    expect(find.text('Create New Contact'), findsOneWidget);

    expect(find.byType(DrawerWidget), findsNothing);

    expect(find.text('Drawer Header'), findsOneWidget);

    expect(find.text('Create New Contact'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.photo));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.info));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    expect(find.text('Putri Diana'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.edit).first);
    await tester.pumpAndSettle();

    expect(find.text('Edit Contact'), findsOneWidget);

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Putri Dayena'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pumpAndSettle();
  });
}
