part of 'riwayat_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// Riwayat widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class RiwayatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Riwayat widget is first created.
class RiwayatInitialEvent extends RiwayatEvent {
  @override
  List<Object?> get props => [];
}


class ChangeStatusEvent extends RiwayatEvent {
  
  final String riwayatId;

  ChangeStatusEvent(this.riwayatId);
  @override
  List<Object?> get props => [riwayatId];
}
