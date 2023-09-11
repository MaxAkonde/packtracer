import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/colis_model.dart';
import '../../data/repository/colis_repository.dart';

part 'colis_event.dart';
part 'colis_state.dart';

class ColisBloc extends Bloc<ColisEvent, ColisState> {
  ColisBloc() : super(LaodingColisState()) {
    final ColisRepository colisRepository = ColisRepository();

    on<LoadColisEvent>((event, emit) async {
      emit(LaodingColisState());
      try {
        final List<ColisModel> colis = await colisRepository.getAll();
        emit(LoadedColisState(colis: colis));
      } catch (e) {
        emit(ErrorColisState(e.toString()));
      }
    });
  }
}
