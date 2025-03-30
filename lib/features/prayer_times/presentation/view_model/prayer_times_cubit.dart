import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/prayer_times_model.dart';
import '../../data/repo/prayer_tomes_repo.dart';

abstract class PrayerTimeState {}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

class PrayerTimeLoaded extends PrayerTimeState {
  final List<PrayerTime> prayerTimes;
  PrayerTimeLoaded(this.prayerTimes);
}

class PrayerTimeError extends PrayerTimeState {
  final String message;
  PrayerTimeError(this.message);
}

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  final PrayerTimeRepository prayerTimeRepository;

  PrayerTimeCubit(this.prayerTimeRepository) : super(PrayerTimeInitial());

  Future<void> getPrayerTimes(double latitude, double longitude) async {
    emit(PrayerTimeLoading());
    try {
      List<PrayerTime> prayerTimes = await prayerTimeRepository
          .fetchPrayerTimes(latitude, longitude);
      emit(PrayerTimeLoaded(prayerTimes));
    } catch (e) {
      emit(PrayerTimeError("فشل تحميل أوقات الصلاة"));
    }
  }
}
