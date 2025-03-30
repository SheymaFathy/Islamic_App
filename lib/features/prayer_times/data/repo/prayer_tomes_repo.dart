import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:islamic_app/core/helper/hosting/hosting.dart';
import 'dart:convert';
import '../model/prayer_times_model.dart';

class PrayerTimeRepository {
  // final String _baseUrl = "http://api.aladhan.com/v1/timings";

  final Map<String, String> prayerNames = {
    "Fajr": "الفجر",
    "Dhuhr": "الظهر",
    "Asr": "العصر",
    "Maghrib": "المغرب",
    "Isha": "العشاء",
    "Sunrise": "الشروق",
    "Sunset": "الغروب",
    "Imsak": "الإمساك",
    "Midnight": "منتصف الليل",
    "Firstthird": "الثلث الأول",
    "Lastthird": "الثلث الاخير",
  };

  Future<List<PrayerTime>> fetchPrayerTimes(
    double latitude,
    double longitude,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${HostingHelper.prayerTimes}?latitude=$latitude&longitude=$longitude&method=5",
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final timings = data['data']['timings'] as Map<String, dynamic>;

        // excluded list
        List<String> excludedPrayerTimes = ["Sunset", "Midnight", "Firstthird", "Lastthird", "Imsak"];

        List<PrayerTime> prayerTimes =
            timings.entries
                .where((entry) => !excludedPrayerTimes.contains(entry.key))
                .map((entry) {
                  return PrayerTime(
                    name: prayerNames[entry.key] ?? entry.key,
                    time: formatTime(entry.value),
                  );
                })
                .toList();

        return prayerTimes;
      } else {
        throw Exception("فشل في تحميل أوقات الصلاة");
      }
    } catch (e) {
      throw Exception("حدث خطأ أثناء جلب البيانات: $e");
    }
  }

  String formatTime(String time24) {
    try {
      final parsedTime = DateFormat("HH:mm").parse(time24);
      String formattedTime = DateFormat.jm().format(parsedTime);
      formattedTime = formattedTime
          .replaceAll("AM", "صباحًا")
          .replaceAll("PM", "مساءً");

      return formattedTime;
    } catch (e) {
      return time24;
    }
  }
}
