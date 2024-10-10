part of 'rincian_pembayaran_upload_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// RincianPembayaranUpload widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class RincianPembayaranUploadEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the RincianPembayaranUpload widget is first created.
class RincianPembayaranUploadInitialEvent extends RincianPembayaranUploadEvent {
  @override
  List<Object?> get props => [];
}
