import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [booking_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// ignore_for_file: must_be_immutable
class BookingModel extends Equatable {
  BookingModel({this.selectedBookingDateField, this.bookingDateField = "dd/mm/yyyy"}) {
    selectedBookingDateField = selectedBookingDateField ?? DateTime.now();
  }

  DateTime? selectedBookingDateField;
  String bookingDateField;

  BookingModel copyWith({
    DateTime? selectedBookingDateField,
    String? bookingDateField,
  }) {
    return BookingModel(
      selectedBookingDateField: selectedBookingDateField ?? this.selectedBookingDateField,
      bookingDateField: bookingDateField ?? this.bookingDateField,
    );
  }

  @override
  List<Object?> get props => [ selectedBookingDateField, bookingDateField];
}
