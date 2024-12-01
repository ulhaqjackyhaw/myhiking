part of 'route_bloc.dart';

/// Represents the state of Route in the application.
class RouteState extends Equatable {
  final bool isLoading; // Menandai apakah data sedang dimuat
  final Jalur? jalur; // Detail jalur yang diambil dari API
  final Gunung? gunung; // Detail gunung terkait
  final String? errorMessage; // Pesan error jika ada masalah

  const RouteState({
    this.isLoading = false,
    this.jalur,
    this.gunung,
    this.errorMessage,
  });

  /// Copy state dengan nilai baru (immutable)
  RouteState copyWith({
    bool? isLoading,
    Jalur? jalur,
    Gunung? gunung,
    String? errorMessage,
  }) {
    return RouteState(
      isLoading: isLoading ?? this.isLoading,
      jalur: jalur ?? this.jalur,
      gunung: gunung ?? this.gunung,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, jalur, gunung, errorMessage];
}
