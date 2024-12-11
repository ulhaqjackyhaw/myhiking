part of 'pilihan_bank_pembayaran_bloc.dart';

// Represents the state of PilihanBankPembayaran in the application.
class PilihanBankPembayaranState extends Equatable {
  final PilihanBankPembayaranModel? pilihanBankPembayaranModelObj;

  const PilihanBankPembayaranState({this.pilihanBankPembayaranModelObj});

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
