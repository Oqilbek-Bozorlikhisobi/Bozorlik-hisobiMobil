import 'package:bloc/bloc.dart';
import 'package:bozorlik/utils/enums.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryState()) {
    on<HistoryEvent>((event, emit) {
    });
  }
}
