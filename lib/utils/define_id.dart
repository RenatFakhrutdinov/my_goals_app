import 'package:mygoalsapp/blocs/database_bloc/database_bloc_export.dart';

int defineId(DatabaseState state) {
  if (state is DatabaseLoadedState) {
    return state.goals.isEmpty
        ? 0
        : state.goals.map((goal) => goal.id).reduce((a, b) => a > b ? a : b) +
            1;
  } else
    return 0;
}
