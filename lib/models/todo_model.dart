class TodoModel {
  String? tittle, description;

  TodoModel({this.tittle, this.description});

  factory TodoModel.fromMap(Map m1) {
    TodoModel t1 = TodoModel(
      tittle: m1['tittle'],
      description: m1['discription'],
    );
    return t1;
  }
}
