import 'dart:convert';

import 'package:demowork/screens/tab1/data/todo_datasource.dart';
import 'package:demowork/screens/tab1/data/todo_repo.dart';
import 'package:demowork/screens/tab1/model/todo_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../../constants/custom_text_styles.dart';
import '../../utils/app_colors.dart';
import 'bloc/todo_bloc.dart';
import 'package:http/http.dart' as  http;

class TabBarOne extends StatefulWidget {
  const TabBarOne({super.key});

  @override
  State<TabBarOne> createState() => _TabBarOneState();
}

class _TabBarOneState extends State<TabBarOne> {
  TodoBloc todoBloc = TodoBloc(GetDataRepo(getTodoData: GetTodoData()));
  bool isLoading = false;
  List<TodoResponse> todoData = [];
  String endPoint = Constants.of().endpoint;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    getData();
  }

  Future<List<dynamic>> getData() async {

    //todoBloc.add(GetTodoDataEvent());
    Uri apiUrl = Uri.parse(endPoint + ApiEndPoint.todo);


      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        isLoading = false;
        List<dynamic> jsonData = json.decode(response.body);
        setState(() {
          todoData = jsonData.map((item) => TodoResponse.fromJson(item)).toList();
        });
        return jsonData.map((item) => TodoResponse.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load todos');
      }

  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      bloc: todoBloc,
      listener: (context, state) {
        if (state is TodoLoading) {
          print("Loading");
          isLoading = true;
        }
        if (state is GetTodoLoaded) {
          print("Success");
          todoData = List.from(state.todoResponse as Iterable).map((e) => TodoResponse.fromJson(e)).toList();
          isLoading = false;
        }
        if (state is GetTodoFailure) {
          print("something went wrong");
          isLoading = false;

        }
      },
      builder: (context, state) {
        return isLoading ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor)) :
        ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: todoData?.length , // Number of tasks
          itemBuilder: (context, index) {

            final item = todoData![index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Chip(
                      label: Text("UI ux Design",
                          style: CustomTextStyle.labelText),
                      backgroundColor: Colors.grey[300],
                      padding: EdgeInsets.zero,
                      side: const BorderSide(color: Colors.transparent),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                    ),
                    SizedBox(height: 8.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(item.title ?? "",
                            style: CustomTextStyle.labelTextBold,
                          ),
                        ),
                        const Icon(Icons.check_circle, color: Colors.black),
                      ],
                    ),
                    SizedBox(height: 3.sp),
                    Text('Redesign fashion app for up dribble',
                        style: CustomTextStyle.labelText),
                    Divider(
                      color: AppColors.fontColor.withOpacity(0.5),
                      height: 30.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Today, 10:00 am',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.primaryColor))),
                        Text(item.id.toString(),
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.primaryColor)))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
