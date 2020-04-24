import 'package:mygoalsapp/model/goal_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String tableGoals = "goals";
  static const String columnId = "id";
  static const String columnTitle = "title";
  static const String columnDescription = "description";
  static const String columnDate = "date";

  static final DatabaseHelper db = DatabaseHelper.internal();
  DatabaseHelper.internal();

  Database _database;

  Future<Database> get database async {
    print("Database Getter Called .");
    if (_database != null) {
      return _database;
    }
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'goalsDB.db'),
      version: 1,
      onCreate: (Database database, version) async {
        print("Database Created.");
        await database.execute(
          "CREATE TABLE $tableGoals "
          "($columnId INTEGER PRIMARY KEY,"
          "$columnTitle TEXT,"
          "$columnDescription TEXT,"
          "$columnDate TEXT"
          ")",
        );
      },
    );
  }

  Future<List<GoalItem>> getGoals() async {
    final db = await database;
    var goals = await db.query(
      tableGoals,
      columns: [columnId, columnTitle, columnDescription, columnDate],
    );

    List<GoalItem> goalList = List<GoalItem>();
    goals.forEach((currentGoal) {
      GoalItem item = GoalItem.fromMap(currentGoal);
      goalList.add(item);
    });
    return goalList;
  }

  Future<GoalItem> insert(GoalItem item) async {
    final db = await database;
    item.id = await db.insert(tableGoals, item.toMap());
    return item;
  }

  Future<int> update(GoalItem item) async {
    final db = await database;

    return await db.update(
      tableGoals,
      item.toMap(),
      where: "id = ?",
      whereArgs: [item.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      tableGoals,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
