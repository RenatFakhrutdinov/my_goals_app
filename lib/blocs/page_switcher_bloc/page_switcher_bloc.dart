import 'package:flutter_bloc/flutter_bloc.dart';

import 'page_switcher_event.dart';
import 'page_switcher_state.dart';

class PageSwitcherBloc extends Bloc<PageSwitcherEvent, PageSwitcherState> {
  @override
  PageSwitcherState get initialState => PageSwitcherOnMainPage();

  @override
  Stream<PageSwitcherState> mapEventToState(PageSwitcherEvent event) async* {
    if (event is PageSwitcherToAddingWidget) {
      yield PageSwitcherOnAddingWidget(item: event.item);
    } else
      yield PageSwitcherOnMainPage();
  }
}
