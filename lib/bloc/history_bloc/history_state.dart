part of 'history_bloc.dart';

@immutable
abstract class HistoryState {}

class LaodingHistoryState extends HistoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedHistoryState extends HistoryState {
  final List<HistoryModel> history;

  LoadedHistoryState({required this.history});

  @override
  // TODO: implement props
  List<Object?> get props => [history];
}

class ErrorHistoryState extends HistoryState {
  final String error;

  ErrorHistoryState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
