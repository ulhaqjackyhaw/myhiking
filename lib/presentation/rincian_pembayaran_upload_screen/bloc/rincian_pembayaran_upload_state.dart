part of 'rincian_pembayaran_upload_bloc.dart';

/// Represents the state of RincianPembayaranUpload in the application.
// ignore_for_file: must_be_immutable
class RincianPembayaranUploadState extends Equatable {
  RincianPembayaranUploadState({this.rincianPembayaranUploadModelObj});

  RincianPembayaranUploadModel? rincianPembayaranUploadModelObj;

  @override
  List<Object?> get props => [rincianPembayaranUploadModelObj];

  RincianPembayaranUploadState copyWith({
    RincianPembayaranUploadModel? rincianPembayaranUploadModelObj,
  }) {
    return RincianPembayaranUploadState(
      rincianPembayaranUploadModelObj: rincianPembayaranUploadModelObj ??
          this.rincianPembayaranUploadModelObj,
    );
  }
}
