part of 'data_profile_bloc.dart';

/// Represents the state of DataProfile in the application.
//
/// ignore_for_file: must_be_immutable
class DataProfileState extends Equatable {
  final TextEditingController? fullNameInputController;
  final TextEditingController? nikInputController;
  final TextEditingController? phoneNumberInputController;
  final TextEditingController? emergencyContactInputController;
  final TextEditingController? addressInputController;
  final TextEditingController? emailInputController;
  final String? statusMessage;

  DataProfileState({
    this.fullNameInputController,
    this.nikInputController,
    this.phoneNumberInputController,
    this.emergencyContactInputController,
    this.addressInputController,
    this.emailInputController,
    this.statusMessage,
  });

  DataProfileState copyWith({
    TextEditingController? fullNameInputController,
    TextEditingController? nikInputController,
    TextEditingController? phoneNumberInputController,
    TextEditingController? emergencyContactInputController,
    TextEditingController? addressInputController,
    TextEditingController? emailInputController,
    String? statusMessage,
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
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  @override
  List<Object?> get props => [
        fullNameInputController,
        nikInputController,
        phoneNumberInputController,
        emergencyContactInputController,
        addressInputController,
        emailInputController,
        statusMessage,
      ];
}
