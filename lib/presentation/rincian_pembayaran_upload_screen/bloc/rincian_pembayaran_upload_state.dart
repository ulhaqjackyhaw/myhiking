part of 'rincian_pembayaran_upload_bloc.dart';

/// Represents the state of RincianPembayaranUpload in the application.
// ignore_for_file: must_be_immutable
class RincianPembayaranUploadState extends Equatable {
  final RincianPembayaranUploadModel? rincianPembayaranUploadModelObj;
  final String? idPesanan;
  final double? totalBayar;
  final bool isLoading;
  final String error;

  // Constructor with optional parameters.
  RincianPembayaranUploadState({
    this.rincianPembayaranUploadModelObj,
    this.idPesanan,
    this.totalBayar,
    this.isLoading = false,
    this.error = '',
  });

  // Initial state factory
  factory RincianPembayaranUploadState.initial() {
    return RincianPembayaranUploadState(
      isLoading: false,
      error: '',
      rincianPembayaranUploadModelObj: null,
    );
  }

  // Helper method to create a new state with modified values
  RincianPembayaranUploadState copyWith({
    String? idPesanan,
    double? totalBayar,
    bool? isLoading,
    String? error,
    RincianPembayaranUploadModel? rincianPembayaranUploadModelObj,
  }) {
    return RincianPembayaranUploadState(
      idPesanan: idPesanan ?? this.idPesanan,
      totalBayar: totalBayar ?? this.totalBayar,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      rincianPembayaranUploadModelObj: rincianPembayaranUploadModelObj ??
          this.rincianPembayaranUploadModelObj,
    );
  }

  @override
  List<Object?> get props => [idPesanan, totalBayar, isLoading, error, rincianPembayaranUploadModelObj];
}
