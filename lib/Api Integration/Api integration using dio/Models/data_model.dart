class ListModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  ListModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  ListModel.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}
