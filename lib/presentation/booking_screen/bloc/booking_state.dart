part of 'booking_bloc.dart';

/// Represents the state of Booking in the application.
// ignore_for_file: must_be_immutable
class BookingState extends Equatable {
  BookingState({
    this.idInputController,
    this.emailInputController,
    this.phoneInputController,
    this.bookingDateInputController,
    this.bookingModelObj,
  });

  TextEditingController? idInputController;
  TextEditingController? emailInputController;
  TextEditingController? phoneInputController;
  TextEditingController? bookingDateInputController;
  BookingModel? bookingModelObj;

  @override
  List<Object?> get props => [
        idInputController,
        emailInputController,
        phoneInputController,
        bookingDateInputController,
        bookingModelObj,
      ];

  get phoneNumberInputController => null;

  BookingState copyWith({
    TextEditingController? idInputController,
    TextEditingController? emailInputController,
    TextEditingController? phoneInputController,
    TextEditingController? bookingDateInputController,
    BookingModel? bookingModelObj,
  }) {
    return BookingState(
      idInputController: idInputController ?? this.idInputController,
      emailInputController: emailInputController ?? this.emailInputController,
      phoneInputController: phoneInputController ?? this.phoneInputController,
      bookingDateInputController: bookingDateInputController ?? this.bookingDateInputController,
      bookingModelObj: bookingModelObj ?? this.bookingModelObj,
    );
  }
}
