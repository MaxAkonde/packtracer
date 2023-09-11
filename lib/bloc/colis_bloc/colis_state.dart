part of 'colis_bloc.dart';

@immutable
abstract class ColisState {}

class LaodingColisState extends ColisState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedColisState extends ColisState {
  final List<ColisModel> colis;

  LoadedColisState({required this.colis});

  @override
  // TODO: implement props
  List<Object?> get props => [colis];
}

class ErrorColisState extends ColisState {
  final String error;

  ErrorColisState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
