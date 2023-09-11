part of 'demande_bloc.dart';

@immutable
abstract class DemandeEvent {}

class DemandeRequest extends DemandeEvent {
  final String name;
  final String adress;
  final String telephone;
  final String details;

  DemandeRequest(
    this.name,
    this.adress,
    this.telephone,
    this.details,
  );
}
