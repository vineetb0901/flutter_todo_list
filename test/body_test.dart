import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/body.dart';
import 'package:todo_app/pages/completed_todos.dart';
import 'package:todo_app/pages/deleted_todos.dart';
import 'package:todo_app/pages/todos.dart';
import 'package:todo_app/providers/todo_provider.dart';

void main() {
  testWidgets('Body Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => TodoProvider(),
          builder: (context, child) {
            return DefaultTabController(
              length: 3,
              child: Body(),
            );
          },
        ),
      ),
    );


    // Now, find the TodosPage in the widget tree.
    expect(find.byType(TodosPage), findsOneWidget);

    // Verify that the AppBar title is present.
    expect(find.text("Todo List"), findsOneWidget);

    // Verify that the TabBar is present.
    expect(find.byType(TabBar), findsOneWidget);

    // Verify that the TabBarView contains the expected pages.
    // expect(find.byType(TodosPage), findsOneWidget);
    // expect(find.byType(CompletedTodosPage), findsOneWidget);
    // expect(find.byType(DeletedTodosPage), findsOneWidget);
  });
}
