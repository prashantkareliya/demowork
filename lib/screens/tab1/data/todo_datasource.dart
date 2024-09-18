import 'package:flutter/cupertino.dart';

import '../../../constants/constants.dart';
import '../../../httpl_actions/app_http.dart';

class GetTodoData extends HttpActions {

  Future<dynamic> getTodo() async {
    final response = await getMethod(ApiEndPoint.todo);
    //debugPrint("get Profile Details -  $response");

    return response;
  }
}