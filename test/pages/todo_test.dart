import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';

void main() {
  testWidgets('TodoPage Widget Test', (WidgetTester tester) async {
    // Create a Todo instance for testing
    final Todo todo = Todo(
      title: "Test Todo",
      date: "2022-01-31",
      time: "08:00 AM",
      description: "This is a test description.",
      category: "TestCat",
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => TodoProvider(),
          builder: (context, child) {
            return TodoPage(todo: todo);
          },
        ),
      ),
    );

    // Wait for the widget to rebuild.
    await tester.pumpAndSettle();

    // Verify that the title, description, and date/time are displayed correctly
    expect(find.text("Test Todo"), findsOneWidget);
    expect(find.text("This is a test description."), findsOneWidget);
    // expect(find.text("TestCat"), findsOneWidget);
    // Verify that the date and time are displayed correctly
    // Verify that the back button and delete button are present
    // expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
    // expect(find.byIcon(Icons.delete), findsOneWidget);
  });
}
