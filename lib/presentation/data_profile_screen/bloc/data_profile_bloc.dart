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
  }  

  _onInitialize(  
    DataProfileInitialEvent event,  
    Emitter<DataProfileState> emit,  
  ) async {  
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