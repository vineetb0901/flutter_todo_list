import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/pages/todos.dart';

void main() {
  testWidgets('TodosPage widget test', (WidgetTester tester) async {
    // Wrap the TodosPage widget with the ChangeNotifierProvider
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => TodoProvider(),
        builder: (context, child) => MaterialApp(
          home: DefaultTabController(
            length: 3,
            child: TodosPage(),
          ),
        ),
      ),
    );

    // Trigger a frame to build the widget
    await tester.pump();

    // Verify that there are no error widgets in the tree
    expect(find.byType(ErrorWidget), findsNothing);
  });
}
