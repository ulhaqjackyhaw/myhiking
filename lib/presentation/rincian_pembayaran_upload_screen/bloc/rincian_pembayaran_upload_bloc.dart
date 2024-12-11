import 'package:equatable/equatable.dart';
import '../../../api/api_service.dart';
import '../../../core/app_export.dart';
import '../models/rincian_pembayaran_upload_model.dart';

part 'rincian_pembayaran_upload_event.dart';
part 'rincian_pembayaran_upload_state.dart';

/// A bloc that manages the state of a RincianPembayaranUpload according to
/// the event that is dispatched to it.
class RincianPembayaranUploadBloc
    extends Bloc<RincianPembayaranUploadEvent, RincianPembayaranUploadState> {
  final ApiService apiService;

  // Konstruktor dengan apiService sebagai parameter.
  RincianPembayaranUploadBloc({required this.apiService})
      : super(RincianPembayaranUploadState(
          rincianPembayaranUploadModelObj: RincianPembayaranUploadModel(),
        )) {
    on<RincianPembayaranUploadInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RincianPembayaranUploadInitialEvent event,
    Emitter<RincianPembayaranUploadState> emit,
  ) async {}
}
