part of 'riwayat_bloc.dart';

/// Represents the state of Riwayat in the application.
// ignore_for_file: must_be_immutable
class RiwayatState extends Equatable {
  RiwayatState({this.riwayatModelObj});

  RiwayatModel? riwayatModelObj;

  @override
  List<Object?> get props => [riwayatModelObj];

  RiwayatState copyWith({RiwayatModel? riwayatModelObj, required String errorMessage}) {
    return RiwayatState(
      riwayatModelObj: riwayatModelObj ?? this.riwayatModelObj,
    );
  }
}
