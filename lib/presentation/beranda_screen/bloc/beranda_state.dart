part of 'beranda_bloc.dart';

/// Represents the state of Beranda in the application.
// ignore_for_file: must_be_immutable
class BerandaState extends Equatable {
  BerandaState({
    this.searchController,
    this.berandaInitialModelObj,
    this.berandaModelObj,
  });

  TextEditingController? searchController;
  BerandaModel? berandaModelObj;
  BerandaInitialModel? berandaInitialModelObj;

  @override
  List<Object?> get props => [
        searchController,
        berandaInitialModelObj,
        berandaModelObj,
      ];

  BerandaState copyWith({
    TextEditingController? searchController,
    BerandaInitialModel? berandaInitialModelObj,
    BerandaModel? berandaModelObj,
  }) {
    return BerandaState(
      searchController: searchController ?? this.searchController,
      berandaInitialModelObj: berandaInitialModelObj ?? this.berandaInitialModelObj,
      berandaModelObj: berandaModelObj ?? this.berandaModelObj,
    );
  }
}
