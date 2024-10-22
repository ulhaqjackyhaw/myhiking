part of 'booking_bloc.dart';

/// Represents the state of Booking in the application.
// ignore_for_file: must_be_immutable
class BookingState extends Equatable {
  BookingState({
    this.bookingDateFieldController,
    this.memberIdFieldController,
    this.memberNameFieldController,
    this.bookingModelObj,
  });

  TextEditingController? bookingDateFieldController;
  TextEditingController? memberIdFieldController;
  TextEditingController? memberNameFieldController;
  BookingModel? bookingModelObj;

  @override
  List<Object?> get props => [
        bookingDateFieldController,
        memberIdFieldController,
        memberNameFieldController,
        bookingModelObj,
      ];

  get phoneNumberInputController => null;

  BookingState copyWith({
    TextEditingController? bookingDateFieldController,
    TextEditingController? memberIdFieldController,
    TextEditingController? memberNameFieldController,
    BookingModel? bookingModelObj,
  }) {
    return BookingState(
      bookingDateFieldController: bookingDateFieldController ?? this.bookingDateFieldController,
      memberIdFieldController: memberIdFieldController ?? this.memberIdFieldController,
      memberNameFieldController: memberNameFieldController ?? this.memberNameFieldController,
      bookingModelObj: bookingModelObj ?? this.bookingModelObj,
    );
  }
}
