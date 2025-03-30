import 'package:flutter_bloc/flutter_bloc.dart';

class TasbeehCubit extends Cubit<List<int>> {
  TasbeehCubit() : super(List.filled(5, 0));

  int currentTasbeehIndex = 0;

  void increment() {
    final newState = List<int>.from(state);
    newState[currentTasbeehIndex] += 1;
    emit(newState);
  }

  void reset() {
    final newState = List<int>.from(state);
    newState[currentTasbeehIndex] = 0;
    emit(newState);
  }

  void nextTasbeeh() {
    if (currentTasbeehIndex < state.length - 1) {
      currentTasbeehIndex++;
    } else {
      currentTasbeehIndex = 0;
    }
    emit(List<int>.from(state));
  }
}
