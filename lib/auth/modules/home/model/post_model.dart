class PostModel {
  String body;
  int id;
  String title;
  int userId;

  PostModel({this.body = '', this.id = 0, this.title = '', this.userId = 0});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      body: json['body'] ?? '',
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      userId: json['userId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = body;
    data['id'] = id;
    data['title'] = title;
    data['userId'] = userId;
    return data;
  }
}
