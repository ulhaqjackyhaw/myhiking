part of 'tata_tertib_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// TataTertib widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class TataTertibEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the TataTertib widget is first created.
class TataTertibInitialEvent extends TataTertibEvent {
  @override
  List<Object?> get props => [];
}
