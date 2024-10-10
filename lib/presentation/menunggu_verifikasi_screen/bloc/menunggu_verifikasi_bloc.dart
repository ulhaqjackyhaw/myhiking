import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/menunggu_verifikasi_model.dart';
part 'menunggu_verifikasi_event.dart';
part 'menunggu_verifikasi_state.dart';

/// A bloc that manages the state of a MenungguVerifikasi according to 
/// the event that is dispatched to it.
class MenungguVerifikasiBloc
    extends Bloc<MenungguVerifikasiEvent, MenungguVerifikasiState> {
  
  MenungguVerifikasiBloc(super.initialState) {
    on<MenungguVerifikasiInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MenungguVerifikasiInitialEvent event,
    Emitter<MenungguVerifikasiState> emit,
  ) async {}
}
