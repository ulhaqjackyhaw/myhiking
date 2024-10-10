import 'package:flutter/material.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'bloc/menunggu_verifikasi_bloc.dart';
import 'models/menunggu_verifikasi_model.dart';

class MenungguVerifikasiScreen extends StatelessWidget {
  const MenungguVerifikasiScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<MenungguVerifikasiBloc>(
      create: (context) => MenungguVerifikasiBloc(MenungguVerifikasiState(
        menungguVerifikasiModelObj: const MenungguVerifikasiModel(),
      ))
        ..add(MenungguVerifikasiInitialEvent()),
      child: const MenungguVerifikasiScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenungguVerifikasiBloc, MenungguVerifikasiState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray5001,
            body: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 2.h,
                    right: 12.h,
                  ),
                  child: Column(
                    children: [
                      _buildVerificationHeader(context),
                      SizedBox(height: 18.h),
                      _buildBookingDetailsSection(context),
                      SizedBox(height: 8.h),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimary,
                          borderRadius: BorderRadiusStyle.roundedBorder14,
                          boxShadow: [
                            BoxShadow(
                              color: appTheme.black900.withOpacity(0.04),
                              spreadRadius: 2.h,
                              blurRadius: 2.h,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "msg_menunggu_verifikasi".tr,
                              style: CustomTextStyles.titleLargeBlack900,
                            ),
                            SizedBox(height: 20.h),
                            CustomImageView(
                              imagePath: ImageConstant.imgVectorPrimary,
                              height: 138.h,
                              width: 138.h,
                            ),
                            SizedBox(height: 38.h),
                            _buildOrderDateRow(
                              context,
                              tanggalpesanan: "lbl_no_pesanan".tr,
                              date: "lbl_12312312323".tr,
                            ),
                            SizedBox(height: 2.h),
                            _buildOrderDateRow(
                              context,
                              tanggalpesanan: "msg_tanggal_pesanan".tr,
                              date: "lbl_20_10_2024".tr,
                            ),
                            _buildOrderDateRow(
                              context,
                              tanggalpesanan: "lbl_nama_pemesan".tr,
                              date: "lbl_pratista_s".tr,
                            ),
                            SizedBox(height: 2.h),
                            _buildOrderDateRow(
                              context,
                              tanggalpesanan: "lbl_total_anggota".tr,
                              date: "lbl_5".tr,
                            ),
                            _buildOrderDateRow(
                              context,
                              tanggalpesanan: "lbl_total_harga".tr,
                              date: "lbl_25_000".tr,
                            ),
                            SizedBox(height: 68.h),
                            Text(
                              "msg_pesanan_akan_diverifikasi".tr,
                              style: CustomTextStyles.labelMediumGray50002,
                            ),
                            SizedBox(height: 10.h),
                            CustomElevatedButton(
                              height: 48.h,
                              text: "msg_batalkan_pesanan".tr.toUpperCase(),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              buttonTextStyle: theme.textTheme.labelLarge!,
                            ),
                            SizedBox(height: 16.h),
                            CustomOutlinedButton(
                              text: "lbl_kembali_ke_home".tr.toUpperCase(),
                              onPressed: () {
                                onTapKembalikehome(context);
                              },
                            ),
                            SizedBox(height: 6.h),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVerificationHeader(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgArrowDown,
            height: 18.h,
            width: 18.h,
            onTap: () {
              onTapImgArrowdownone(context);
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(right: 118.h),
              child: Text(
                "lbl_verifikasi".tr,
                style: CustomTextStyles.titleMediumGray900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingDetailsSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
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
          ),
          SizedBox(height: 26.h),
          Text(
            "lbl_detail_pesanan".tr,
            style: CustomTextStyles.titleMediumGray900_1,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDateRow(
    BuildContext context, {
    required String tanggalpesanan,
    required String date,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tanggalpesanan,
          style: CustomTextStyles.titleMediumGray50003.copyWith(
            color: appTheme.gray50003,
          ),
        ),
        Text(
          date,
          style: CustomTextStyles.titleMediumGray50003.copyWith(
            color: appTheme.gray50003,
          ),
        ),
      ],
    );
  }

  onTapImgArrowdownone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.berandaScreen);
  }

  onTapKembalikehome(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.berandaScreen);
  }
}
