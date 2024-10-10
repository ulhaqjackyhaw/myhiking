part of 'data_profile_bloc.dart';

/// Represents the state of DataProfile in the application.
//
/// ignore_for_file: must_be_immutable
class DataProfileState extends Equatable {
  DataProfileState(
      {this.fullNameInputController,
      this.nikInputController,
      this.phoneNumberInputController,
      this.emergencyContactInputController,
      this.addressInputController,
      this.emailInputController,
      this.dataProfileModelObj});

  TextEditingController? fullNameInputController;
  TextEditingController? nikInputController;
  TextEditingController? phoneNumberInputController;
  TextEditingController? emergencyContactInputController;
  TextEditingController? addressInputController;
  TextEditingController? emailInputController;
  DataProfileModel? dataProfileModelObj;

  @override
  List<Object?> get props => [
        fullNameInputController,
        nikInputController,
        phoneNumberInputController,
        emergencyContactInputController,
        addressInputController,
        emailInputController,
        dataProfileModelObj
      ];
  DataProfileState copyWith({
    TextEditingController? fullNameInputController,
    TextEditingController? nikInputController,
    TextEditingController? phoneNumberInputController,
    TextEditingController? emergencyContactInputController,
    TextEditingController? addressInputController,
    TextEditingController? emailInputController,
    DataProfileModel? dataProfileModelObj,
  }) {
    return DataProfileState(
      fullNameInputController:
          fullNameInputController ?? this.fullNameInputController,
      nikInputController: nikInputController ?? this.nikInputController,
      phoneNumberInputController:
          phoneNumberInputController ?? this.phoneNumberInputController,
      emergencyContactInputController: emergencyContactInputController ??
          this.emergencyContactInputController,
      addressInputController:
          addressInputController ?? this.addressInputController,
      emailInputController: emailInputController ?? this.emailInputController,
      dataProfileModelObj: dataProfileModelObj ?? this.dataProfileModelObj,
    );
  }
}
