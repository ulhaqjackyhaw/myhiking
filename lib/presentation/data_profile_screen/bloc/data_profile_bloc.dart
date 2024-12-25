import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:myhiking/api/api_service.dart';
import '../../../core/app_export.dart';
import '../models/data_profile_model.dart';
part 'data_profile_event.dart';
part 'data_profile_state.dart';

class DataProfileBloc extends Bloc<DataProfileEvent, DataProfileState> {
  final ApiService apiService;

  DataProfileBloc({required this.apiService}) : super(DataProfileState()) {
    on<DataProfileInitialEvent>(_onInitialize);
    on<SaveDataEvent>(_onSaveData);
    on<DisposeEvent>(_onDispose);
    on<DateOfBirthChangedEvent>(_onUserDate);

    // Menambahkan event untuk menangani perubahan pada setiap TextField
    on<FullNameChangedEvent>((event, emit) => _onTextFieldChanged(event, emit,
        (controller) => state.copyWith(fullNameInputController: controller)));
    on<NikChangedEvent>((event, emit) => _onTextFieldChanged(event, emit,
        (controller) => state.copyWith(nikInputController: controller)));
    on<PhoneNumberChangedEvent>((event, emit) => _onTextFieldChanged(
        event,
        emit,
        (controller) =>
            state.copyWith(phoneNumberInputController: controller)));
    on<EmergencyContactChangedEvent>((event, emit) => _onTextFieldChanged(
        event,
        emit,
        (controller) =>
            state.copyWith(emergencyContactInputController: controller)));
    on<AddressChangedEvent>((event, emit) => _onTextFieldChanged(event, emit,
        (controller) => state.copyWith(addressInputController: controller)));
    on<EmailChangedEvent>((event, emit) => _onTextFieldChanged(event, emit,
        (controller) => state.copyWith(emailInputController: controller)));
  }
  Future<void> _onUserDate(
      DateOfBirthChangedEvent event, Emitter<DataProfileState> emit) async {
    // Update the state with the new date in the controller
    emit(state.copyWith(
      dateOfBirthController: TextEditingController(text: event.dateOfBirth),
    ));
  }

  void _onTextFieldChanged(
    DataProfileEvent event,
    Emitter<DataProfileState> emit,
    DataProfileState Function(TextEditingController controller) updateState,
  ) {
    final controller = event is FullNameChangedEvent
        ? state.fullNameInputController
        : event is NikChangedEvent
            ? state.nikInputController
            : event is PhoneNumberChangedEvent
                ? state.phoneNumberInputController
                : event is EmergencyContactChangedEvent
                    ? state.emergencyContactInputController
                    : event is AddressChangedEvent
                        ? state.addressInputController
                        : state.emailInputController;

    final text = event is FullNameChangedEvent
        ? event.value
        : event is NikChangedEvent
            ? event.value
            : event is PhoneNumberChangedEvent
                ? event.value
                : event is EmergencyContactChangedEvent
                    ? event.value
                    : event is AddressChangedEvent
                        ? event.value
                        : event is EmailChangedEvent
                            ? event.value
                            : '';

    if (controller != null) {
      controller.text = text;
      emit(updateState(controller));
    } else {
      emit(updateState(TextEditingController(text: text)));
    }
  }

  void _onSaveData(SaveDataEvent event, Emitter<DataProfileState> emit) {
    // Logika penyimpanan data
    final fullName = state.fullNameInputController?.text ?? '';
    final nik = state.nikInputController?.text ?? '';
    final phoneNumber = state.phoneNumberInputController?.text ?? '';
    final emergencyContact = state.emergencyContactInputController?.text ?? '';
    final address = state.addressInputController?.text ?? '';
    final email = state.emailInputController?.text ?? '';

    print('Data berhasil disimpan:');
    print('Full Name: $fullName');
    print('NIK: $nik');
    print('Phone Number: $phoneNumber');
    print('Emergency Contact: $emergencyContact');
    print('Address: $address');
    print('Email: $email');

    // Emit state jika perlu menampilkan notifikasi atau mengubah UI
    emit(state.copyWith());
  }

  void _onDispose(DisposeEvent event, Emitter<DataProfileState> emit) {
    state.fullNameInputController?.dispose();
    state.nikInputController?.dispose();
    state.phoneNumberInputController?.dispose();
    state.emergencyContactInputController?.dispose();
    state.addressInputController?.dispose();
    state.emailInputController?.dispose();
  }

  void _onInitialize(
      DataProfileInitialEvent event, Emitter<DataProfileState> emit) {
    if (state.fullNameInputController == null) {
      emit(
        state.copyWith(
          fullNameInputController: TextEditingController(),
          nikInputController: TextEditingController(),
          phoneNumberInputController: TextEditingController(),
          emergencyContactInputController: TextEditingController(),
          addressInputController: TextEditingController(),
          emailInputController: TextEditingController(),
        ),
      );
    }
  }
}
