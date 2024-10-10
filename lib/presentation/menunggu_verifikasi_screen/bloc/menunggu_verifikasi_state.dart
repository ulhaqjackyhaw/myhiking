part of 'menunggu_verifikasi_bloc.dart';

/// Represents the state of MenungguVerifikasi in the application.
// ignore_for_file: must_be_immutable
class MenungguVerifikasiState extends Equatable {
  MenungguVerifikasiState({this.menungguVerifikasiModelObj});

  MenungguVerifikasiModel? menungguVerifikasiModelObj;

  @override
  List<Object?> get props => [menungguVerifikasiModelObj];

  MenungguVerifikasiState copyWith({
    MenungguVerifikasiModel? menungguVerifikasiModelObj,
  }) {
    return MenungguVerifikasiState(
      menungguVerifikasiModelObj:
          menungguVerifikasiModelObj ?? this.menungguVerifikasiModelObj,
    );
  }
}
