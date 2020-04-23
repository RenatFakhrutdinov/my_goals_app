class GoalItem {
  String title, description, date;

  GoalItem(this.title, this.description, this.date);

  GoalItem.fromMap(Map<String, dynamic> map) {
    this.title = map["title"];
    this.description = map["description"];
    this.date = map["date"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["title"] = title;
    map["dateCreated"] = description;
    map["date"] = date;
    return map;
  }
}
