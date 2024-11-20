part of 'route_bloc.dart';

class RouteState extends Equatable {
  final RouteModel? routeModelObj;
  final String? error;
  final bool isLoading;  // Menambahkan status loading

  const RouteState({
    this.routeModelObj,
    this.error,
    this.isLoading = false,  // Default nilai loading adalah false
  });

  RouteState copyWith({
    RouteModel? routeModelObj,
    String? error,
    bool? isLoading,  // Menambahkan parameter isLoading
  }) {
    return RouteState(
      routeModelObj: routeModelObj ?? this.routeModelObj,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,  // Menyalin nilai isLoading
    );
  }

  @override
  List<Object?> get props => [routeModelObj, error, isLoading];
}
