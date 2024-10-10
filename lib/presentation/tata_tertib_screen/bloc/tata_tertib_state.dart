part of 'tata_tertib_bloc.dart';

/// Represents the state of TataTertib in the application.
// ignore_for_file: must_be_immutable
class TataTertibState extends Equatable {
  TataTertibState({this.tataTertibModelObj});

  TataTertibModel? tataTertibModelObj;

  @override
  List<Object?> get props => [tataTertibModelObj];

  TataTertibState copyWith({TataTertibModel? tataTertibModelObj}) {
    return TataTertibState(
      tataTertibModelObj: tataTertibModelObj ?? this.tataTertibModelObj,
    );
  }
}
