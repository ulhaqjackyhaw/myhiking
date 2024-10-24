import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/pop_up_lengkapi_data_diri_bloc.dart';
import 'models/pop_up_lengkapi_data_diri_model.dart'; // ignore_for_file: must_be

class PopUpLengkapiDataDiriDialog extends StatelessWidget {
  const PopUpLengkapiDataDiriDialog({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<PopUpLengkapiDataDiriBloc>(
      create: (context) => PopUpLengkapiDataDiriBloc(
        PopUpLengkapiDataDiriState(
          const PopUpLengkapiDataDiriModel(),
        ),
      )..add(PopUpLengkapiDataDiriInitialEvent()),
      child: const PopUpLengkapiDataDiriDialog(),
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
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 20.h,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 6.h),
              SizedBox(
                height: 30.h,
                child: VerticalDivider(
                  width: 6.h,
                  thickness: 6.h,
                  color: appTheme.redA700,
                ),
              ),
              SizedBox(height: 8.h),
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 10.h,
                width: 10.h,
              ),
              SizedBox(height: 26.h),
              Text(
                "msg_harap_lengkapi_data".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallBlack900.copyWith(
                  // ...
                  height: 1.40,
                ),
              ),
              SizedBox(height: 32.h),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      height: 25.h,
                      width: 72.h,
                      text: "lbl_batal".tr,
                      buttonStyle: CustomButtonStyles.fillRed,
                      buttonTextStyle: CustomTextStyles.labelMediumOnPrimary,
                      onPressed: () {
                        onTapBatal(context);
                      },
                    ),
                    CustomElevatedButton(
                      height: 25.h,
                      width: 72.h,
                      text: "lbl_lengkapi".tr,
                      buttonStyle: CustomButtonStyles.fillPrimaryTL12,
                      buttonTextStyle: CustomTextStyles.labelMediumOnPrimary,
                      onPressed: () {
                        onTapLengkapi(context);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

// ...

// Navigates to the berandaScreen when the action is triggered.
  onTapBatal(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.berandaScreen,
    );
  }

// Navigates to the dataProfileScreen when the action is triggered.
  onTapLengkapi(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dataProfileScreen,
    );
  }
}