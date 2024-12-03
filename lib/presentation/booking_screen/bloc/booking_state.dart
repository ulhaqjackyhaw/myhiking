part of 'booking_bloc.dart';

/// Represents the state of Booking in the application.
class BookingState extends Equatable {
  // Constructor to initialize optional parameters with default values if necessary

  // Optional parameters for form field controllers
  final TextEditingController? bookingDateFieldController;
  final TextEditingController? memberIdFieldController;
  final TextEditingController? memberNameFieldController;
  final JalurModel? jalur;
  final Gunung? gunung; // Detail gunung terkait
  // Booking data object
  // final BookingModel? bookingModelObj;

  // Loading indicator flag
  final bool isLoading;

  // Error message (if any)
  final String error;
  BookingState({
    this.bookingDateFieldController,
    this.memberIdFieldController,
    this.memberNameFieldController,
    this.jalur,
    this.gunung,
    // this.bookingModelObj,
    this.isLoading = false,
    this.error = '',
  });

  @override
  List<Object?> get props => [
        bookingDateFieldController,
        memberIdFieldController,
        memberNameFieldController,
        jalur,
        gunung,
        // bookingModelObj,
        isLoading,
        error,
      ];

  // CopyWith method for updating state
  BookingState copyWith({
    TextEditingController? bookingDateFieldController,
    TextEditingController? memberIdFieldController,
    TextEditingController? memberNameFieldController,
    JalurModel? jalur,
    Gunung? gunung, // Detail gunung terkait
    // BookingModel? bookingModelObj,
    bool? isLoading,
    String? error,
  }) {
    return BookingState(
      bookingDateFieldController:
          bookingDateFieldController ?? this.bookingDateFieldController,
      memberIdFieldController:
          memberIdFieldController ?? this.memberIdFieldController,
      memberNameFieldController:
          memberNameFieldController ?? this.memberNameFieldController,
      jalur: jalur ?? this.jalur,
      gunung: gunung ?? this.gunung,
      // bookingModelObj: bookingModelObj ?? this.bookingModelObj,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  // // A method for easy state reset if needed
  // BookingState reset() {
  //   return BookingState(
  //     bookingDateFieldController: null,
  //     memberIdFieldController: null,
  //     memberNameFieldController: null,
  //     bookingModelObj: null,
  //     isLoading: false,
  //     error: '',
  //   );
  // }
}
