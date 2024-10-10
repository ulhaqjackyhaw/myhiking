import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/tiket_model.dart';

part 'tiket_event.dart';
part 'tiket_state.dart';

/// A bloc that manages the state of a Tiket according to the event that is dispatched to it.
class TiketBloc extends Bloc<TiketEvent, TiketState> {
  TiketBloc(super.initialState) {
    on<TiketInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TiketInitialEvent event,
    Emitter<TiketState> emit,
  ) async {
    // Add initialization logic here
  }
}
