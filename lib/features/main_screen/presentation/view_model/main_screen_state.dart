import 'package:flutter/cupertino.dart';

@immutable
abstract class MainScreenState {}

class BottomNavInitial extends MainScreenState {}

class BottomNavChanged extends MainScreenState {
  final int index;
  BottomNavChanged(this.index);
}
