part of 'detail_mountain_bloc.dart';

/// Represents the state of DetailMountain in the application.
class DetailMountainState extends Equatable {
  final DetailMountainModel? detailMountainModelObj;
  final String? error; // Menambahkan properti error
  final bool isLoading; // Menambahkan status loading

  const DetailMountainState({
    this.detailMountainModelObj,
    this.error,
    this.isLoading = false, // Default nilai loading adalah false
  });

  DetailMountainState copyWith({
    DetailMountainModel? detailMountainModelObj,
    String? error,
    bool? isLoading, // Menambahkan parameter isLoading
  }) {
    return DetailMountainState(
      detailMountainModelObj:
          detailMountainModelObj ?? this.detailMountainModelObj,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading, // Menyalin nilai isLoading
    );
  }

  @override
  List<Object?> get props => [detailMountainModelObj, error, isLoading];
}
