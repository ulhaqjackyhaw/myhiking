part of 'booking_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// Booking widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class BookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Booking widget is first created.
class BookingInitialEvent extends BookingEvent {
  @override
  List<Object?> get props => [];
}

/// Event for changing date
// ignore_for_file: must_be_immutable
class ChangeDateEvent extends BookingEvent {
  ChangeDateEvent({required this.date});
  DateTime date;

  @override
  List<Object?> get props => [date];
}
