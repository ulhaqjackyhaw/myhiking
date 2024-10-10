part of 'pilihan_bank_pembayaran_bloc.dart';

/// Represents the state of PilihanBankPembayaran in the application.
// ignore_for_file: must_be_immutable
class PilihanBankPembayaranState extends Equatable {
  const PilihanBankPembayaranState({this.pilihanBankPembayaranModelObj});

  final PilihanBankPembayaranModel? pilihanBankPembayaranModelObj;

  @override
  List<Object?> get props => [pilihanBankPembayaranModelObj];

  PilihanBankPembayaranState copyWith({
    PilihanBankPembayaranModel? pilihanBankPembayaranModelObj,
  }) {
    return PilihanBankPembayaranState(
      pilihanBankPembayaranModelObj:
          pilihanBankPembayaranModelObj ?? this.pilihanBankPembayaranModelObj,
    );
  }
}
