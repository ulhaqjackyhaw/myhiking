part of 'pilihan_bank_pembayaran_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// PilihanBankPembayaran widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class PilihanBankPembayaranEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the PilihanBankPembayaran widget
/// is first created.
class PilihanBankPembayaranInitialEvent extends PilihanBankPembayaranEvent {
  @override
  List<Object?> get props => [];
}

// ignore_for_file: must_be_immutable
class PaymentmethodslistItemEvent extends PilihanBankPembayaranEvent {
  PaymentmethodslistItemEvent({required this.index, this.radioGroup});

  final int index;
  final String? radioGroup;

  @override
  List<Object?> get props => [index, radioGroup];
}
