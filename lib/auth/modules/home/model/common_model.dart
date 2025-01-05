class CommonModel {
  bool status;
  String message;

  CommonModel({this.status = true, this.message = 'Success'});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(status: json['status'] ?? true, message: json['message'] ?? 'Success');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
