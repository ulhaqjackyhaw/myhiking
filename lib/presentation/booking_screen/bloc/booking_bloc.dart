import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/booking_model.dart';

part 'booking_event.dart';
part 'booking_state.dart';

/// A bloc that manages the state of a Booking according to the event that is dispatched to it.
class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc(super.initialState) {
    on<BookingInitialEvent>(_onInitialize);
    on<ChangeDateEvent>(_changeDate);
  }

  _onInitialize(
    BookingInitialEvent event,
    Emitter<BookingState> emit,
  ) async {
    emit(
      state.copyWith(
        idInputController: TextEditingController(),
        emailInputController: TextEditingController(),
        phoneInputController: TextEditingController(),
        bookingDateInputController: TextEditingController(),
      ),
    );
  }

  _changeDate(
    ChangeDateEvent event,
    Emitter<BookingState> emit,
  ) {
    emit(
      state.copyWith(
        bookingModelObj: state.bookingModelObj?.copyWith(
          selectedBookingDateInput: event.date,
        ),
      ),
    );
  }
}
