import 'package:equatable/equatable.dart';
import 'package:mygoalsapp/model/goal_item.dart';

abstract class PageSwitcherState extends Equatable {
  @override
  List<Object> get props => [];
}

class PageSwitcherOnMainPage extends PageSwitcherState {}

class PageSwitcherOnAddingWidget extends PageSwitcherState {
  final GoalItem item;

  PageSwitcherOnAddingWidget({this.item});

  @override
  List<Object> get props => [item];
}
