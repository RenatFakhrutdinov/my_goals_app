import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mygoalsapp/model/goal_item.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object> get props => [];
}

class DatabaseLoadingState extends DatabaseState {}

class DatabaseLoadedState extends DatabaseState {
  final List<GoalItem> goals;

  DatabaseLoadedState({@required this.goals});

  @override
  List<Object> get props => [goals];

  @override
  String toString() => "DatabaseLoadedState { goals $goals }";
}

class DatabaseErrorState extends DatabaseState {
  final String errorText;

  DatabaseErrorState({@required this.errorText});

  @override
  String toString() => "DatabaseErrorState { error $errorText }";
}
