import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/tata_tertib_model.dart';

part 'tata_tertib_event.dart';
part 'tata_tertib_state.dart';

/// A bloc that manages the state of a TataTertib according to
/// the event that is dispatched to it.
class TataTertibBloc extends Bloc<TataTertibEvent, TataTertibState> {
  TataTertibBloc(super.initialState) {
    on<TataTertibInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TataTertibInitialEvent event,
    Emitter<TataTertibState> emit,
  ) async {}
}
