part of 'transaksi_bloc.dart';

/// Represents the state of Transaksi in the application.
// ignore_for_file: must_be_immutable
class TransaksiState extends Equatable {
  TransaksiState({this.transaksiModelObj});

  TransaksiModel? transaksiModelObj;

  @override
  List<Object?> get props => [transaksiModelObj];

  TransaksiState copyWith({TransaksiModel? transaksiModelObj}) {
    return TransaksiState(
      transaksiModelObj: transaksiModelObj ?? this.transaksiModelObj,
    );
  }
}
