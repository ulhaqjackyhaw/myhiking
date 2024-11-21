part of 'detail_mountain_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// DetailMountain widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class DetailMountainEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the DetailMountain widget is first created.
class DetailMountainInitialEvent extends DetailMountainEvent {
  final int idGunung;

  DetailMountainInitialEvent(this.idGunung);

  // @override
  // List<Object?> get props => [idGunung];
}
