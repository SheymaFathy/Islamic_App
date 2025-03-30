import 'package:islamic_app/features/azkar/data/model/azkar_model.dart';

class AdhkarCategory {
  final String title;
  final List<AdhkarModel> adhkar;

  AdhkarCategory({required this.title, required this.adhkar});

  factory AdhkarCategory.fromJson(String key, dynamic value) {
    return AdhkarCategory(
      title: key,
      adhkar: (value as List).map((e) => AdhkarModel.fromJson(e)).toList(),
    );
  }
}
