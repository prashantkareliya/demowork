import 'package:demowork/screens/tab1/data/todo_datasource.dart';

import '../../../constants/handle_api_error.dart';
import '../../../httpl_actions/api_result.dart';
import '../model/todo_response_model.dart';

class GetDataRepo {

  GetDataRepo({required GetTodoData getTodoData})
      : _getTodoData = getTodoData;
  final GetTodoData _getTodoData;

  Future<ApiResult<TodoResponse>> getProfile() async {

      final result = await _getTodoData.getTodo();

      TodoResponse todoResponse = TodoResponse.fromJson(result);

      if (todoResponse.id != null) {
        return ApiResult.success(data: todoResponse);
      } else {
        return const ApiResult.failure(error: "Something went wrong");
      }

  }
}