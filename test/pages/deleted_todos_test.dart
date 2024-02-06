import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/pages/deleted_todos.dart';

void main() {
  testWidgets('DeletedTodosPage Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => TodoProvider(),
          builder: (context, child) {
            return const DeletedTodosPage();
          },
        ),
      ),
    );

    // Wait for the widget to rebuild.
    await tester.pumpAndSettle();

    // Verify that the text "You have not deleted any tasks" is present
    expect(find.text("You have not deleted any tasks"), findsOneWidget);

    // Verify that no TodoTile widgets are present
    expect(find.byType(TodoTile), findsNothing);
  });
}
