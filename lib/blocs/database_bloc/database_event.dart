import 'package:equatable/equatable.dart';
import 'package:mygoalsapp/model/goal_item.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object> get props => [];
}

class DatabaseLoadEvent extends DatabaseEvent {}

class DatabaseAddEvent extends DatabaseEvent {
  final GoalItem item;

  DatabaseAddEvent(this.item);

  @override
  List<Object> get props => [item];

  @override
  String toString() => "DatabaseAddEvent { item: $item }";
}

class DatabaseUpdateEvent extends DatabaseEvent {
  final GoalItem item;

  DatabaseUpdateEvent(this.item);

  @override
  List<Object> get props => [item];

  @override
  String toString() => "DatabaseUpdateEvent { item: $item }";
}

class DatabaseDeleteEvent extends DatabaseEvent {
  final int itemId;

  DatabaseDeleteEvent(this.itemId);

  @override
  List<Object> get props => [itemId];

  @override
  String toString() => "DatabaseDeleteEvent { itemId: $itemId }";
}
