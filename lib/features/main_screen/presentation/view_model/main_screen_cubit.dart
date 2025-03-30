import 'package:bloc/bloc.dart';
import 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(BottomNavInitial());

  int currentIndex = 0;

  void changeTab(int index) {
    currentIndex = index;
    emit(BottomNavChanged(index));
  }
}
