import 'package:equatable/equatable.dart';
import 'package:mygoalsapp/model/goal_item.dart';

abstract class PageSwitcherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PageSwitcherToMainPage extends PageSwitcherEvent {}

class PageSwitcherToAddingWidget extends PageSwitcherEvent {
  final GoalItem item;

  PageSwitcherToAddingWidget({this.item});

  @override
  List<Object> get props => [item];
}
