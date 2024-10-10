part of 'tiket_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// Tiket widget.
///
/// Events must be immutable and implement the [Equatable] interface.
abstract class TiketEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Tiket widget is first created.
class TiketInitialEvent extends TiketEvent {
  @override
  List<Object?> get props => [];
}
