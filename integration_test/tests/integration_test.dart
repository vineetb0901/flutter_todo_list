import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/main.dart' as todo_app;
import '../../integration_test/screens/todo/ todo_home_screen.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Creation of todo :', () {
    testWidgets(
      'Validate todo Creation',
      (tester) async {
        //Arrange
        todo_app.main();
        await tester.pumpAndSettle();
        final todoHomeScreen = TodoHomeScreen(tester);

        // Test Data Setup
        const title = 'Automation Test TODO';
        const description =
            'This TODO is created by Flutter INtegration Test Package.';

        // Actions to Perform
        await todoHomeScreen.addTodo(title, description);

        // Assertions
        final isTodoCreated = await todoHomeScreen.isTodoPresent(title);
        expect(isTodoCreated, true);
      },
      skip: false,
      timeout: const Timeout(Duration(minutes: 5)),
    );
  });

  group('Deletion of todo', () {
    testWidgets(
      'Validate deletion',
      (tester) async {
        todo_app.main();
        await tester.pumpAndSettle();
        final todoHomeScreen = TodoHomeScreen(tester);

        // Actions to Perform

        await todoHomeScreen.deleteTodo();

        // Assertions

        await tester.pumpAndSettle();
        // expect(find.byType(AlertDialog), findsOneWidget);
        await tester.tap(find.text('Yes'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Deleted'));
        await tester.pumpAndSettle();
        expect(find.byType(TodoTile), findsWidgets);
      },
      skip: false,
      timeout: const Timeout(Duration(minutes: 5)),
    );
  });

  group('group name', () {});
}
