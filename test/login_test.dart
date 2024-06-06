import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/screens/login_screen.dart';

void main() {
  testWidgets('Successful login navigates to todo list', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    await tester.enterText(find.byType(TextField).first, 'user@example.com');
    await tester.enterText(find.byType(TextField).last, 'password');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Todo List'), findsOneWidget);
    expect(find.text('Buy milk'), findsOneWidget);

    
  });

  testWidgets('Unsuccessful login shows error message', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    await tester.enterText(find.byType(TextField).first, 'user@example.com');
    await tester.enterText(find.byType(TextField).last, 'wrongpassword');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Invalid credentials'), findsOneWidget);
  });

  testWidgets('Todo list displays items', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Realiza login con credenciales correctas.
    await tester.enterText(find.byType(TextField).first, 'user@example.com');
    await tester.enterText(find.byType(TextField).last, 'password');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verifica que los ítems de la lista de tareas se muestran correctamente.
    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.text('Walk the dog'), findsOneWidget);
    expect(find.text('Do homework'), findsOneWidget);
  });
}
