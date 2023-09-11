import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/history_model.dart';
import '../../data/repository/history_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(LaodingHistoryState()) {
    final HistoryRepository historyRepository = HistoryRepository();

    on<LoadHistoryEvent>((event, emit) async {
      emit(LaodingHistoryState());
      try {
        final List<HistoryModel> histories =
            await historyRepository.getByColis(event.idColis);
        emit(LoadedHistoryState(history: histories));
      } catch (e) {
        emit(ErrorHistoryState(e.toString()));
      }
    });
  }
}
