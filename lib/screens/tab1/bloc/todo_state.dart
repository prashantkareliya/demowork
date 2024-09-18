part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class GetTodoLoaded extends TodoState {
  TodoResponse todoResponse;

  GetTodoLoaded({required this.todoResponse});
}

class GetTodoFailure extends TodoState {
  final String error;

  GetTodoFailure(this.error);
}

class TodoLoading extends TodoState {
  final bool isBusy;

  TodoLoading(this.isBusy);
}
