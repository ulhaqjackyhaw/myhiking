part of 'menunggu_verifikasi_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// MenungguVerifikasi widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class MenungguVerifikasiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the MenungguVerifikasi widget is first created.
class MenungguVerifikasiInitialEvent extends MenungguVerifikasiEvent {
  @override
  List<Object?> get props => [];
}
