import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mygoalsapp/database/database_helper.dart';
import 'package:mygoalsapp/model/goal_item.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

main() {
  group('database tests', () {
    final databaseHelper = MockDatabaseHelper();
    GoalItem item = GoalItem(1, "title", "description", "today");

    test('getGoals method pass', () async {
      await databaseHelper.getGoals();
      verify(await databaseHelper.getGoals());
    });

    test('getGoals method returns List', () async {
      when(databaseHelper.getGoals()).thenAnswer((_) => Future.value([item]));
      expect(await databaseHelper.getGoals(), [item]);
    });

    test('insert method pass', () async {
      await databaseHelper.insert(item);
      verify(await databaseHelper.insert(item));
    });

    test('insert method returns GoalItem', () async {
      when(databaseHelper.insert(item)).thenAnswer((_) => Future.value(item));
      expect(await databaseHelper.insert(item), item);
    });

    test('update method pass', () async {
      await databaseHelper.update(item);
      verify(await databaseHelper.update(item));
    });

    test('delete method pass', () async {
      await databaseHelper.delete(1);
      verify(await databaseHelper.delete(1));
    });
  });
}
