part of 'regist_bloc.dart';

/// Represents the state of Regist in the application.
// ignore_for_file: must_be_immutable
class RegistState extends Equatable {
  RegistState({
    this.edittextoneController,
    this.emailtwoController,
    this.passwordtwoController,
    this.passwordthreeController,
    this.registModelObj,
  });

  TextEditingController? edittextoneController;
  TextEditingController? emailtwoController;
  TextEditingController? passwordtwoController;
  TextEditingController? passwordthreeController;
  RegistModel? registModelObj;

  RegistState copyWith({
    TextEditingController? edittextoneController,
    TextEditingController? emailtwoController,
    TextEditingController? passwordtwoController,
    TextEditingController? passwordthreeController,
    RegistModel? registModelObj,
  }) {
    return RegistState(
      edittextoneController: edittextoneController ?? this.edittextoneController,
      emailtwoController: emailtwoController ?? this.emailtwoController,
      passwordtwoController: passwordtwoController ?? this.passwordtwoController,
      passwordthreeController: passwordthreeController ?? this.passwordthreeController,
      registModelObj: registModelObj ?? this.registModelObj,
    );
  }

  @override
  List<Object?> get props => [
        edittextoneController,
        emailtwoController,
        passwordtwoController,
        passwordthreeController,
        registModelObj,
      ];
}
