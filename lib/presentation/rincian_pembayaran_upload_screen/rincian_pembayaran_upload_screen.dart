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
  const RincianPembayaranUploadScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<RincianPembayaranUploadBloc>(
      create: (context) => RincianPembayaranUploadBloc(
        RincianPembayaranUploadState(
          rincianPembayaranUploadModelObj: RincianPembayaranUploadModel(),
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
                      _buildTimerRow(context),
                      SizedBox(height: 26.h),
                      _buildPaymentDetailsStack(context),
                      SizedBox(height: 16.h),
                      _buildUploadProofRow(context),
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
                      // _buildReturnHomeColumn(context),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: _buildReturnHomeColumn(context),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 40.h,
      title: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: 13.h), // Adjust margins as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between items
          children: [
            // Back Button
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back
              },
              padding: EdgeInsets.only(right: 16.h), // Adjust padding as needed
            ),
            Expanded(
              child: Center(
                child: AppbarSubtitleOne(
                  text: "lbl_booking".tr,
                ),
              ),
            ),
            // Placeholder for spacing, adjust if needed
            SizedBox(width: 40.h), // You can adjust this width
          ],
        ),
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
  Widget _buildTimerRow(BuildContext context) {
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
  Widget _buildPaymentDetailsStack(BuildContext context) {
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
                width: 190.h,
                alignment: Alignment.topCenter,
              ),
              Container(
                width: 240.h,
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
                                  width: 38.h,
                                  radius: BorderRadius.circular(
                                    8.h,
                                  ),
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
                    SizedBox(height: 6.h),
                    Text(
                      "msg_atas_nama_gn_slamet".tr,
                      style: CustomTextStyles.labelMediumPrimary10,
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
  Widget _buildUploadProofRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 26.h,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder14,
        border: Border.all(
          color: appTheme.gray50004,
          width: 1.h,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgProfile,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(width: 18.h),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "msg_upload_bukti_pembayaran".tr,
              style: CustomTextStyles.labelLargeGray50004,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildReturnHomeColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomOutlinedButton(
            text: "lbl_kembali_ke_home".tr.toUpperCase(),
            margin: EdgeInsets.only(bottom: 12.h),
            onPressed: () {
              onTapKembalikehome(context);
            },
          ),
        ],
      ),
    );
  }

  /// Navigates to the pilihanBankPembayaranScreen when the action is triggered.
  void onTapArrowdownone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.pilihanBankPembayaranScreen,
    );
  }

  /// Navigates to the menungguVerifikasiScreen when the action is triggered.
  void onTapKirim(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.menungguVerifikasiScreen,
    );
  }

  /// Navigates to the berandaScreen when the action is triggered.
  void onTapKembalikehome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.berandaScreen,
    );
  }
}
