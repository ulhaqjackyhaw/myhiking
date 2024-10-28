part of 'pilihan_bank_pembayaran_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// PilihanBankPembayaran widget.
///
/// Events must be immutable and implement the [Equatable] interface.
abstract class PilihanBankPembayaranEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the PilihanBankPembayaran widget
/// is first created.
class PilihanBankPembayaranInitialEvent extends PilihanBankPembayaranEvent {
  // Constructor tidak perlu properti tambahan
}

/// Event that is dispatched when a payment method is selected.
class PaymentmethodslistItemEvent extends PilihanBankPembayaranEvent {
  // Constructor dengan parameter yang required
  PaymentmethodslistItemEvent({required this.index});

  final int index; // Index dari metode pembayaran yang dipilih

  @override
  List<Object?> get props => [index]; // Menyertakan index dalam props
}
