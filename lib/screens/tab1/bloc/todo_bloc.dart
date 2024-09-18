import 'package:bloc/bloc.dart';
import 'package:demowork/screens/tab1/model/todo_response_model.dart';
import 'package:meta/meta.dart';

import '../data/todo_repo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetDataRepo getDataRepo;

  TodoBloc(this.getDataRepo) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {});

    on<GetTodoDataEvent>((event, emit) => getData(event, emit));

  }

  getData(GetTodoDataEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading(true));

    final response = await getDataRepo.getProfile();

    response.when(success: (success) {
      emit(TodoLoading(false));
      emit(GetTodoLoaded(todoResponse: success));
    }, failure: (failure) {
      emit(TodoLoading(false));
      emit(GetTodoFailure(failure.toString()));
    });
  }
}
