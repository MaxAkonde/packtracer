part of 'demande_bloc.dart';

@immutable
abstract class DemandeState {}

class DemandeInitial extends DemandeState {
  @override
  List<Object?> get props => [];
}

class FormDemandeSuccess extends DemandeState {
  @override
  List<Object?> get props => [];
}

class FormDemandeError extends DemandeState {
  final String error;

  FormDemandeError(this.error);
  @override
  List<Object?> get props => [];
}
