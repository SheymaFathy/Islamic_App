class AdhkarModel {
  final String content;

  AdhkarModel({required this.content});

  factory AdhkarModel.fromJson(Map<String, dynamic> json) {
    return AdhkarModel(content: json["content"] as String);
  }
}
