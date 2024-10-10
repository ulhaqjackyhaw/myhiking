part of 'transaksi_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// Transaksi widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class TransaksiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Transaksi widget is first created.
class TransaksiInitialEvent extends TransaksiEvent {
  @override
  List<Object?> get props => [];
}
