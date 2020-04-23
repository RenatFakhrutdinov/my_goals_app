class GoalItem {
  String title, description;

  GoalItem(this.title, this.description);

  GoalItem.fromMap(Map<String, dynamic> map) {
    this.title = map["title"];
    this.description = map["description"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["title"] = title;
    map["dateCreated"] = description;
    return map;
  }
}
