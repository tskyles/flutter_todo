class Todo {
  int id;
  String description;
  bool isDone = false;

  Todo({this.id, this.description, this.isDone = false});

  factory Todo.fromDatabaseJSON(Map<String, dynamic> data) => Todo(
        //This will be used to convert JSON objects that
        //are coming from querying the database and converting
        //it into a Todo object
        id: data['id'],
        description: data['description'],
        //Since sqlite doesn't have boolean type for true/false
        //we will 0 to denote that it is false
        //and 1 for true
        isDone: data['isDone'] == 0 ? false : true,
      );

  Map<String, dynamic> toDatabaseJSON() => {
        "id": this.id,
        "description": this.description,
        "isDone": this.isDone == false ? 0 : 1,
      };
}
