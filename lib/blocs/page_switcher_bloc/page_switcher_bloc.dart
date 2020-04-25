import 'package:flutter_bloc/flutter_bloc.dart';

enum PageSwitcherEvent { toMainScreen, toAddingGoalScreen }
enum PageSwitcherState { onMainScreen, onAnimatorScreen, onAddingGoalScreen }

class PageSwitcherBloc extends Bloc<PageSwitcherEvent, PageSwitcherState> {
  @override
  PageSwitcherState get initialState => PageSwitcherState.onMainScreen;

  @override
  Stream<PageSwitcherState> mapEventToState(PageSwitcherEvent event) async* {
    switch (event) {
      case PageSwitcherEvent.toMainScreen:
        yield PageSwitcherState.onAnimatorScreen;
        await Future.delayed(Duration(milliseconds: 1500));
        yield PageSwitcherState.onMainScreen;
        break;
      case PageSwitcherEvent.toAddingGoalScreen:
        yield PageSwitcherState.onAnimatorScreen;
        await Future.delayed(Duration(milliseconds: 1500));
        yield PageSwitcherState.onAddingGoalScreen;
        break;
    }
  }
}
