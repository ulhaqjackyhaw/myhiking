import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/reset_kirim_email_bloc.dart';
import 'models/reset_kirim_email_model.dart';

class ResetKirimEmailScreen extends StatelessWidget {
  const ResetKirimEmailScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<ResetKirimEmailBloc>(
      create: (context) => ResetKirimEmailBloc(
        ResetKirimEmailState(
          resetKirimEmailModelObj: const ResetKirimEmailModel(),
        ),
      )..add(ResetKirimEmailInitialEvent()),
      child: const ResetKirimEmailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 24.h,
            top: 12.h,
            right: 24.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgNn,
                    height: 54.h,
                    width: 68.h,
                  ),
                  Text(
                    "lbl_myhiking".tr,
                    style: theme.textTheme.headlineLarge,
                  ),
                  Text(
                    "msg_your_hiking_assistance".tr,
                    style: CustomTextStyles.bodySmallBluegray900,
                  ),
                ],
              ),
              SizedBox(height: 74.h),
              CustomImageView(
                imagePath: ImageConstant.img37081,
                height: 192.h,
                width: double.maxFinite,
                margin: EdgeInsets.only(
                  left: 4.h,
                  right: 18.h,
                ),
              ),
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    "lbl_reset_password".tr,
                    style: CustomTextStyles.titleMediumSemiBold,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              _buildEmailInputSection(context),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                text: "lbl_kirim".tr,
                margin: EdgeInsets.only(
                  left: 62.h,
                  right: 68.h,
                ),
                onPressed: () {
                  onTapKirim(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildRegistrationPromptSection(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailInputSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_email2".tr,
            style: theme.textTheme.labelMedium,
          ),
          BlocSelector<ResetKirimEmailBloc, ResetKirimEmailState, TextEditingController?>(
            selector: (state) => state.passwordController,
            builder: (context, passwordController) {
              return CustomTextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                contentPadding: EdgeInsets.all(12.h),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRegistrationPromptSection(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              onTapTxtBelumpunyaakun2(context);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "msg_belum_punya_akun".tr,
                      style: CustomTextStyles.labelMediumGray6000110,
                    ),
                    TextSpan(
                      text: "msg_registrasi_di_sini".tr,
                      style: CustomTextStyles.labelMedium10_1,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the kodeVerifikasiScreen when the action is triggered.
  void onTapKirim(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.kodeVerifikasiScreen);
  }

  /// Navigates to the registScreen when the action is triggered.
  void onTapTxtBelumpunyaakun2(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.registScreen);
  }
}
