abstract class TasbeehState {}

class TasbeehInitial extends TasbeehState {}

class TasbeehCountUpdated extends TasbeehState {
  final List<int> counts;
  TasbeehCountUpdated(this.counts);
}
