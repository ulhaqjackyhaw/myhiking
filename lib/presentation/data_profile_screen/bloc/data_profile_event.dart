part of 'data_profile_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// DataProfile widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class DataProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the DataProfile widget is first created.
class DataProfileInitialEvent extends DataProfileEvent {
  @override
  List<Object?> get props => [];
}

class SaveDataEvent extends DataProfileEvent {}

class DisposeEvent extends DataProfileEvent {}
