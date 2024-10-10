import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/regist_model.dart';

part 'regist_event.dart';
part 'regist_state.dart';

/// A bloc that manages the state of a Regist according to the event that is dispatched to it.
class RegistBloc extends Bloc<RegistEvent, RegistState> {
  RegistBloc(super.initialState) {
    on<RegistInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    RegistInitialEvent event,
    Emitter<RegistState> emit,
  ) async {
    emit(
      state.copyWith(
        edittextoneController: TextEditingController(),
        emailtwoController: TextEditingController(),
        passwordtwoController: TextEditingController(),
        passwordthreeController: TextEditingController(),
      ),
    );
  }
}
