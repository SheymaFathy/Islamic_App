import 'package:islamic_app/features/azkar/data/model/adhkar_category_model.dart';

abstract class AdhkarState {}

class AdhkarInitial extends AdhkarState {}

class AdhkarLoading extends AdhkarState {}

class AdhkarLoaded extends AdhkarState {
  final List<AdhkarCategory> adhkar;
  AdhkarLoaded(this.adhkar);
}

class AdhkarError extends AdhkarState {
  final String message;
  AdhkarError(this.message);
}
