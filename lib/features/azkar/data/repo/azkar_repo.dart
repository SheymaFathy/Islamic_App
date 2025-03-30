// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:islamic_app/features/azkar/data/model/adhkar_category_model.dart';

class AdhkarRepository {
  Future<List<AdhkarCategory>> fetchAdhkar() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/json_apis/adhkar.json',
      );
      final Map<String, dynamic> jsonData = json.decode(response);

      List<AdhkarCategory> adhkarList =
          jsonData.entries
              .map((entry) => AdhkarCategory.fromJson(entry.key, entry.value))
              .toList();

      return adhkarList;
    } catch (e) {
      print("❌ حدث خطأ أثناء تحميل الأذكار: $e");
      throw Exception("فشل تحميل الأذكار");
    }
  }
}
