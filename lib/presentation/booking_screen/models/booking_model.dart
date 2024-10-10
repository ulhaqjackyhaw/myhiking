import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [booking_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable
class BookingModel extends Equatable {
  BookingModel({this.selectedBookingDateInput, this.bookingDateInput = "\"\""}) {
    selectedBookingDateInput = selectedBookingDateInput ?? DateTime.now();
  }

  DateTime? selectedBookingDateInput;
  String bookingDateInput;

  BookingModel copyWith({
    DateTime? selectedBookingDateInput,
    String? bookingDateInput,
  }) {
    return BookingModel(
      selectedBookingDateInput: selectedBookingDateInput ?? this.selectedBookingDateInput,
      bookingDateInput: bookingDateInput ?? this.bookingDateInput,
    );
  }

  @override
  List<Object?> get props => [selectedBookingDateInput, bookingDateInput];
}
