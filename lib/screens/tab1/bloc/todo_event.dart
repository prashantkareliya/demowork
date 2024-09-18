part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}


class GetTodoDataEvent extends TodoEvent {

  GetTodoDataEvent();
}