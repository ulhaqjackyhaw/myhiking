import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/pop_up_pw_diganti_bloc.dart';
import 'models/pop_up_pw_diganti_model.dart'; // ignore_for_file: rule

class PopUpPwDigantiDialog extends StatelessWidget {
  const PopUpPwDigantiDialog({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<PopUpPwDigantiBloc>(
      create: (context) => PopUpPwDigantiBloc(
        PopUpPwDigantiState(
            popUpPwDigantiModelObj: const PopUpPwDigantiModel()),
      )..add(PopUpPwDigantiInitialEvent()),
      child: const PopUpPwDigantiDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 26.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 70.h,
                width: 70.h,
              ),
              SizedBox(height: 6.h),
              Text(
                "msg_selamat_password".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallBlack900.copyWith(
                  height: 1.40,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              CustomElevatedButton(
                height: 24.h,
                width: 72.h,
                text: "lbl_lanjut".tr,
                buttonStyle: CustomButtonStyles.fillPrimaryTL12,
                buttonTextStyle: CustomTextStyles.labelMediumOnPrimarySemiBold,
                onPressed: () {
                  onTapContinueButton(context);
                },
              ),
              SizedBox(height: 2.h)
            ],
          ),
        )
      ],
    );
  }

  // Navigates to the loginScreen when the action is triggered.
  onTapContinueButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
