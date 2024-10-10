part of 'tiket_bloc.dart';

/// Represents the state of Tiket in the application.
// ignore_for_file: must_be_immutable
class TiketState extends Equatable {
  TiketState({this.tiketModelObj});

  TiketModel? tiketModelObj;

  @override
  List<Object?> get props => [tiketModelObj];

  TiketState copyWith({TiketModel? tiketModelObj}) {
    return TiketState(
      tiketModelObj: tiketModelObj ?? this.tiketModelObj,
    );
  }
}
