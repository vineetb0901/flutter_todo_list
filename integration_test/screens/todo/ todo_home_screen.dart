import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/components/todo_tile.dart';

class TodoHomeScreen {
  late WidgetTester tester;

  TodoHomeScreen(this.tester);

  final _addTodoIconLocator = find.byType(FloatingActionButton);
  // final _todoTitleTextField = find.byType(TextField).at(0);
  final _todoTitleTextField = find.widgetWithText(TextField, 'Title');

  // final _todoDescriptionTextField = find.byType(TextField).at(1);
    final _todoDescriptionTextField = find.widgetWithText(TextField, 'Description');

  final _createTodoIcon = find.byIcon(LineIcons.paperPlane);

  final _firstCard = find.byType(Card).at(0);

  final _deleteIcon = find.byIcon(LineIcons.trash);

  Future addTodo(String title, String description) async {
    await tester.pumpAndSettle();
    await tester.tap(_addTodoIconLocator, warnIfMissed: true);
    await tester.pumpAndSettle();
    await tester.enterText(_todoTitleTextField, title);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.enterText(_todoDescriptionTextField, title);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.tap(_createTodoIcon, warnIfMissed: true);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 5));
  }

  Future isTodoPresent(String title) async {
    final todoLocator =
        find.descendant(of: find.byType(TodoTile), matching: find.text(title));
    return tester.any(todoLocator);
  }

  Future deleteTodo() async {
    await tester.tap(_firstCard, warnIfMissed: true);
    await tester.pumpAndSettle();
    await tester.tap(_deleteIcon, warnIfMissed: true);
  }
}
