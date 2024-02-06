import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart'; // Import your provider

void main() {
  testWidgets('TodoTile widget test', (WidgetTester tester) async {
    // Create a Todo instance for testing
    Todo todo = Todo(
      title: 'Test Todo',
      date: 'Jan 1, 2023',
      time: '9:00 AM',
      description: 'This is a test todo.',
      category: 'Urgent',
    );

    // Build the TodoTile widget within a MultiProvider
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TodoProvider()),
          // Add any other providers your TodoTile depends on
        ],
        child: MaterialApp(
          home: TodoTile(todo: todo),
        ),
      ),
    );

    // Verify that there are no error widgets in the tree
    expect(find.byType(ErrorWidget), findsNothing);
  });
}
