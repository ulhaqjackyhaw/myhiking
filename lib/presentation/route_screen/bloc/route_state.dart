part of 'route_bloc.dart';

/// Represents the state of Route in the application.
// ignore_for_file: must_be_immutable
class RouteState extends Equatable {
  RouteState({this.routeModelObj});

  RouteModel? routeModelObj;

  @override
  List<Object?> get props => [routeModelObj];

  RouteState copyWith({RouteModel? routeModelObj}) {
    return RouteState(
      routeModelObj: routeModelObj ?? this.routeModelObj,
    );
  }
}
