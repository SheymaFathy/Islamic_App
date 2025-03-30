// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islamic_app/core/constants/styles.dart';
import 'package:islamic_app/core/widgets/custom_scaffold_background.dart';
import '../../data/model/prayer_times_model.dart';
import '../view_model/prayer_times_cubit.dart';
import 'package:intl/intl.dart';

import '../view_model/prayer_times_state.dart';

class PrayerTimeView extends StatefulWidget {
  const PrayerTimeView({super.key});

  @override
  _PrayerTimeViewState createState() => _PrayerTimeViewState();
}

class _PrayerTimeViewState extends State<PrayerTimeView> {
  @override
  void initState() {
    super.initState();
    _fetchPrayerTimes();
  }

  Future<void> _fetchPrayerTimes() async {
    try {
      Position position = await _determinePosition();
      context.read<PrayerTimeCubit>().getPrayerTimes(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      context.read<PrayerTimeCubit>().emit(
        PrayerTimeError("فشل في الحصول على الموقع الجغرافي"),
      );
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('خدمة الموقع غير مفعلة');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('تم رفض إذن الموقع');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('تم رفض إذن الموقع بشكل دائم');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomScaffoldBackground(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 180),
                const Text("أوقات الصلاة", style: AppStyles.title),
                Text(
                  DateFormat('yyyy-MM-dd').format(DateTime.now()),
                  style: AppStyles.subtitle.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
                    builder: (context, state) {
                      if (state is PrayerTimeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is PrayerTimeLoaded) {
                        return _buildPrayerTimesList(state.prayerTimes);
                      } else if (state is PrayerTimeError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text("لم يتم تحميل أوقات الصلاة بعد."),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimesList(List<PrayerTime> prayerTimes) {
    return ListView.builder(
      itemCount: prayerTimes.length,
      itemBuilder: (context, index) {
        PrayerTime prayer = prayerTimes[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.transparent,
          elevation: 0,
          child: ListTile(
            title: Text(prayer.name, style: AppStyles.subtitle),
            trailing: Text(prayer.time, style: AppStyles.body),
          ),
        );
      },
    );
  }
}
