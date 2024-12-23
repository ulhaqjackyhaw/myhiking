import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/data_profile_model.dart';
part 'data_profile_event.dart';
part 'data_profile_state.dart';

/// A bloc that manages the state of a DataProfile according to the event that is dispatched to it.
class DataProfileBloc extends Bloc<DataProfileEvent, DataProfileState> {
  DataProfileBloc(super.initialState) {
    on<DataProfileInitialEvent>(_onInitialize);
    on<SaveDataEvent>(_onSaveData);
    on<DisposeEvent>(_onDispose);
  }

  void _onSaveData(
    SaveDataEvent event,
    Emitter<DataProfileState> emit,
  ) {
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
    emit(state.copyWith(
        // Tambahkan properti untuk status atau logika lain jika diperlukan
        ));
  }

  void _onDispose(
    DisposeEvent event,
    Emitter<DataProfileState> emit,
  ) {
    state.fullNameInputController?.dispose();
    state.nikInputController?.dispose();
    state.phoneNumberInputController?.dispose();
    state.emergencyContactInputController?.dispose();
    state.addressInputController?.dispose();
    state.emailInputController?.dispose();
  }

  void _onInitialize(
    DataProfileInitialEvent event,
    Emitter<DataProfileState> emit,
  ) {
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
