import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/prayer_times/presentation/view_model/prayer_times_state.dart';
import '../../data/model/prayer_times_model.dart';
import '../../data/repo/prayer_tomes_repo.dart';



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
