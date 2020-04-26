import 'package:flutter_test/flutter_test.dart';
import 'package:mygoalsapp/blocs/database_bloc/database_bloc_export.dart';
import 'package:mygoalsapp/model/goal_item.dart';
import 'package:mygoalsapp/utils/define_id.dart';

void main() {
  test("defineId functiomn works correct", () {
    List<GoalItem> goalsEmpty = [];
    List<GoalItem> goalsOneItem = [
      GoalItem(
        4,
        "test",
        "test",
        "test",
      ),
    ];
    List<GoalItem> goalsFewItems = [
      GoalItem(
        4,
        "test",
        "test",
        "test",
      ),
      GoalItem(
        2,
        "test",
        "test",
        "test",
      ),
      GoalItem(
        6,
        "test",
        "test",
        "test",
      ),
      GoalItem(
        45,
        "test",
        "test",
        "test",
      ),
    ];

    expect(defineId(DatabaseLoadingState()), 0);
    expect(defineId(DatabaseLoadedState(goals: goalsEmpty)), 0);
    expect(defineId(DatabaseLoadedState(goals: goalsOneItem)), 5);
    expect(defineId(DatabaseLoadedState(goals: goalsFewItems)), 46);
  });
}
