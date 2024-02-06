import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/pages/completed_todos.dart';

void main() {
  testWidgets('CompletedTodosPage Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => TodoProvider(),
          builder: (context, child) {
            return const CompletedTodosPage();
          },
        ),
      ),
    );

    // Assuming you have completed todos in your provider
    // Wait for the widget to rebuild.
    await tester.pumpAndSettle();

    // Verify that the text "You have not completed any tasks" is not present
    expect(find.text("2 Completed"), findsNothing);

    // Verify that the number of completed todos is displayed
    expect(find.text("You have not completed any tasks"), findsOneWidget);
   

    // Verify that the Divider is present

    // Verify that the TodoTile widgets are present
    expect(find.byType(TodoTile), findsNWidgets(0)); // Adjust the count based on your test data
  });
}
