import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/blocs/database_bloc/database_event.dart';
import 'package:mygoalsapp/blocs/database_bloc/database_state.dart';
import 'package:mygoalsapp/database/database_helper.dart';
import 'package:mygoalsapp/model/goal_item.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  @override
  DatabaseState get initialState => DatabaseLoadingState();

  @override
  Stream<DatabaseState> mapEventToState(DatabaseEvent event) async* {
    if (event is DatabaseLoadEvent) {
      yield* _mapLoadToState();
    } else if (event is DatabaseAddEvent) {
      yield* _mapAddToState(event);
    } else if (event is DatabaseUpdateEvent) {
      yield* _mapUpdateToState(event);
    } else if (event is DatabaseDeleteEvent) {
      yield* _mapDeleteToState(event);
    }
  }

  Stream<DatabaseState> _mapLoadToState() async* {
    yield DatabaseLoadingState();
    try {
      List<GoalItem> goals = await DatabaseHelper.db.getGoals();
      yield DatabaseLoadedState(goals: goals);
    } catch (e) {
      yield DatabaseErrorState(errorText: e.toString());
    }
  }

  Stream<DatabaseState> _mapAddToState(DatabaseAddEvent event) async* {
    try {
      await DatabaseHelper.db.insert(event.item);
      yield* _mapLoadToState();
    } catch (e) {
      yield DatabaseErrorState(errorText: e.toString());
    }
  }

  Stream<DatabaseState> _mapUpdateToState(DatabaseUpdateEvent event) async* {
    try {
      await DatabaseHelper.db.update(event.item);
      yield* _mapLoadToState();
    } catch (e) {
      yield DatabaseErrorState(errorText: e.toString());
    }
  }

  Stream<DatabaseState> _mapDeleteToState(DatabaseDeleteEvent event) async* {
    try {} catch (e) {
      await DatabaseHelper.db.delete(event.itemId);
      yield* _mapLoadToState();
      yield DatabaseErrorState(errorText: e.toString());
    }
  }
}
