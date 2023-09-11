part of 'colis_bloc.dart';

@immutable
abstract class ColisEvent {}

class LoadColisEvent extends ColisEvent {
  @override
  List<Object?> get props => [];
}
