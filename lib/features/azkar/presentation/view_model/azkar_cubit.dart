import 'package:bloc/bloc.dart';

import '../../data/repo/azkar_repo.dart';
import 'azkar_state.dart';

class AdhkarCubit extends Cubit<AdhkarState> {
  final AdhkarRepository repository;

  AdhkarCubit(this.repository) : super(AdhkarInitial());

  Future<void> loadAdhkar() async {
    emit(AdhkarLoading());
    try {
      final adhkar = await repository.fetchAdhkar();
      emit(AdhkarLoaded(adhkar));
    } catch (e) {
      emit(AdhkarError("❌ خطأ أثناء تحميل الأذكار"));
    }
  }
}
