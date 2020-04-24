class GoalItem {
  int id;
  String title, description, date;

  GoalItem(this.id, this.title, this.description, this.date);

  GoalItem.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.title = map["title"];
    this.description = map["description"];
    this.date = map["date"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    map["date"] = date;
    return map;
  }
}
