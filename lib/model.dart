class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;
  int date;

  TaskModel(
      {this.id = "",
      required this.description,
      required this.title,
      required this.date,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json)
    :this
    (

    description: json['description'],
    title: json['title'],
    date: json['date'],
    id: json['id'],
    isDone: json['isDone']
    );

  // TaskModel fromJson(Map<String, dynamic> json) {
  //   return TaskModel(
  //       description: json['description'],
  //       title: json['title'],
  //       date: json['date'],
  //       id: json['id'],
  //       isDone: json['isDone']);
  // }
  Map<String,dynamic> toJson(){
    return {
      "isDone": isDone,
      "id":id,
      "title":title,
      "description":description,
      "date":date,
    };

  }
}
