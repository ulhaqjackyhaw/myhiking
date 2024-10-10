import 'package:flutter/material.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'bloc/rincian_pembayaran_upload_bloc.dart';
import 'models/rincian_pembayaran_upload_model.dart';

class RincianPembayaranUploadScreen extends StatelessWidget {
  const RincianPembayaranUploadScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<RincianPembayaranUploadBloc>(
      create: (context) => RincianPembayaranUploadBloc(
        RincianPembayaranUploadState(
          rincianPembayaranUploadModelObj: const RincianPembayaranUploadModel(),
        ),
      )..add(RincianPembayaranUploadInitialEvent()),
      child: const RincianPembayaranUploadScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RincianPembayaranUploadBloc,
        RincianPembayaranUploadState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: 14.h,
                    top: 2.h,
                    right: 14.h,
                  ),
                  child: Column(
                    children: [
                      _buildStepperSection(context),
                      SizedBox(height: 22.h),
                      _buildTimerSection(context),
                      SizedBox(height: 26.h),
                      _buildPaymentDetails(context),
                      SizedBox(height: 16.h),
                      _buildUploadProofSection(context),
                      SizedBox(height: 54.h),
                      CustomElevatedButton(
                        height: 48.h,
                        text: "lbl_kirim2".tr.toUpperCase(),
                        margin: EdgeInsets.symmetric(horizontal: 4.h),
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        buttonTextStyle: theme.textTheme.labelLarge!,
                        onPressed: () {
                          onTapKirim(context);
                        },
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: _buildReturnHomeSection(context),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 31.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(left: 13.h),
        onTap: () {
          onTapArrowdownone(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "lbl_booking".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildStepperSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 8.h),
      child: AnotherStepper(
        iconHeight: 24,
        iconWidth: 26,
        stepperDirection: Axis.horizontal,
        activeIndex: 0,
        barThickness: 4,
        inverted: true,
        stepperList: [
          StepperData(
            iconWidget: Container(
              height: 24.h,
              width: 26.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadiusStyle.roundedBorder14,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "lbl_1".tr,
                    style: CustomTextStyles.titleMediumOnPrimary_2,
                  ),
                ],
              ),
            ),
          ),
          StepperData(
            iconWidget: Container(
              height: 24.h,
              width: 26.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadiusStyle.roundedBorder14,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "lbl_2".tr,
                    style: CustomTextStyles.titleMediumOnPrimary_2,
                  ),
                ],
              ),
            ),
          ),
          StepperData(
            iconWidget: Container(
              height: 22.h,
              width: 26.h,
              decoration: BoxDecoration(
                color: appTheme.gray5001,
                borderRadius: BorderRadius.circular(12.h),
                border: Border.all(
                  color: appTheme.blueGray100,
                  width: 2.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTimerSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.h),
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.gray30002,
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMdiClockOutline,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(width: 8.h),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg_selesaikan_pembayaran".tr,
                    style: theme.textTheme.labelSmall,
                  ),
                  Text(
                    "lbl_00_59_58".tr,
                    style: CustomTextStyles.labelMediumPrimary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentDetails(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.symmetric(horizontal: 14.h),
        color: appTheme.gray30002.withOpacity(0.25),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: theme.colorScheme.primary,
            width: 2.h,
          ),
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Container(
          height: 348.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.gray30002.withOpacity(0.25),
            borderRadius: BorderRadiusStyle.roundedBorder20,
            border: Border.all(
              color: theme.colorScheme.primary,
              width: 2.h,
            ),
            boxShadow: [
              BoxShadow(
                color: appTheme.black900.withOpacity(0.25),
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgPaymentByTapping,
                height: 174.h,
                width: 192.h,
                alignment: Alignment.topCenter,
              ),
              Container(
                width: 242.h,
                margin: EdgeInsets.only(bottom: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "msg_id_pesanan_xxxxxxxxxxxxx".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.labelMediumGray50004,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "lbl_rp_25_000".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 18.h),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 4.h),
                      child: Row(
                        children: [
                          Container(
                            height: 36.h,
                            width: 54.h,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onPrimary,
                              borderRadius: BorderRadiusStyle.roundedBorder6,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgLogoBankBri,
                                  height: 36.h,
                                  width: 40.h,
                                  radius: BorderRadius.circular(8.h),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "msg_bank_rakyat_indonesia".tr,
                                  style:
                                      CustomTextStyles.labelLargeBluegray40002,
                                ),
                                Text(
                                  "msg_0166_01_020870_53_8".tr,
                                  style: CustomTextStyles.titleSmallLightblue900
                                      .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUploadProofSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_upload_bukti_pembayaran".tr,
            style: theme.textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          CustomOutlinedButton(
            height: 36.h,
            text: "lbl_upload".tr.toUpperCase(),
            onPressed: () {
              onTapUpload(context);
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildReturnHomeSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      height: 54.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: appTheme.gray5001,
      ),
      child: Center(
        child: CustomOutlinedButton(
          height: 36.h,
          text: "KEMBALI KE BERANDA".tr.toUpperCase(),
          onPressed: () {
            onTapKembaliKeBeranda(context);
          },
        ),
      ),
    );
  }

  /// Event Handlers
  void onTapKirim(BuildContext context) {
    // Handle the send button tap event
  }

  void onTapUpload(BuildContext context) {
    // Handle the upload button tap event
  }

  void onTapKembaliKeBeranda(BuildContext context) {
    // Handle the return to home button tap event
  }

  void onTapArrowdownone(BuildContext context) {
    // Handle the arrow down button tap event
  }
}
