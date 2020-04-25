import 'package:flutter_bloc/flutter_bloc.dart';

enum PageSwitcherEvent { toMainScreen, toAddingGoalScreen }
enum PageSwitcherState { onMainScreen, onAddingGoalScreen }

class PageSwitcherBloc extends Bloc<PageSwitcherEvent, PageSwitcherState> {
  @override
  PageSwitcherState get initialState => PageSwitcherState.onMainScreen;

  @override
  Stream<PageSwitcherState> mapEventToState(PageSwitcherEvent event) async* {
    switch (event) {
      case PageSwitcherEvent.toMainScreen:
        yield PageSwitcherState.onMainScreen;
        break;
      case PageSwitcherEvent.toAddingGoalScreen:
        yield PageSwitcherState.onAddingGoalScreen;
        break;
    }
  }
}
