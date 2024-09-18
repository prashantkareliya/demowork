class TodoResponse {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoResponse({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  // Create a method to convert JSON into TaskModel
  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    return TodoResponse(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  // Create a method to convert TaskModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  // Method to convert a list of JSON to a list of TaskModel
  static List<TodoResponse> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TodoResponse.fromJson(json)).toList();
  }
}