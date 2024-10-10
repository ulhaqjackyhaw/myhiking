import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/rincian_pembayaran_upload_model.dart';

part 'rincian_pembayaran_upload_event.dart';
part 'rincian_pembayaran_upload_state.dart';

/// A bloc that manages the state of a RincianPembayaranUpload according to
/// the event that is dispatched to it.
class RincianPembayaranUploadBloc
    extends Bloc<RincianPembayaranUploadEvent, RincianPembayaranUploadState> {
  RincianPembayaranUploadBloc(super.initialState) {
    on<RincianPembayaranUploadInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RincianPembayaranUploadInitialEvent event,
    Emitter<RincianPembayaranUploadState> emit,
  ) async {}
}
