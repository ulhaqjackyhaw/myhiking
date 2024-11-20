part of 'route_bloc.dart';

/// Abstract class for all events that can be dispatched from the Route widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class RouteEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Route widget is first created.

class RouteInitialEvent extends RouteEvent {}

class RouteSelectEvent extends RouteEvent {
  final String selectedRouteId; // ID jalur yang dipilih

  RouteSelectEvent({required this.selectedRouteId});

  @override
  List<Object> get props => [selectedRouteId];
}
