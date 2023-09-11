import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/demande_repository.dart';

part 'demande_event.dart';
part 'demande_state.dart';

class DemandeBloc extends Bloc<DemandeEvent, DemandeState> {
  final DemandeRepository demandeRepository;

  DemandeBloc({required this.demandeRepository}) : super(DemandeInitial()) {
    on<DemandeRequest>((event, emit) async {
      emit(DemandeInitial());
      try {
        await demandeRepository.collect(
          name: event.name,
          adress: event.adress,
          telephone: event.telephone,
          details: event.details,
        );
        emit(FormDemandeSuccess());
      } catch (e) {
        emit(FormDemandeError(e.toString()));
      }
    });
  }
}
