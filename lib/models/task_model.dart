class TaskModel {
  int id;
  bool completed;
  String description;

  TaskModel({this.completed: false, this.description: ""}) {
    // Gera um código único baseado na data/hora atual
    this.id = DateTime.now().millisecondsSinceEpoch;
  }
}
