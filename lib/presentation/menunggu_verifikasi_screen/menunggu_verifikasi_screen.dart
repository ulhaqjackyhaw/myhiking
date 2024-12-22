import 'package:flutter/material.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:myhiking/presentation/pesanan_dibatalkan_screen/bloc/pesanan_dibatalkan_bloc.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'bloc/menunggu_verifikasi_bloc.dart';
import 'models/menunggu_verifikasi_model.dart';

class MenungguVerifikasiScreen extends StatefulWidget {
  final int pesananId;

  const MenungguVerifikasiScreen({
    super.key,
    required this.pesananId,
  });

  @override
  State<MenungguVerifikasiScreen> createState() =>
      _MenungguVerifikasiScreenState();
}

class _MenungguVerifikasiScreenState extends State<MenungguVerifikasiScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<MenungguVerifikasiBloc>()
        .add(FetchMenungguVerifikasiData(widget.pesananId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenungguVerifikasiBloc, MenungguVerifikasiState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.error != null) {
          return Center(
            child: Text("Terjadi kesalahan: ${state.error}"),
          );
        }

        final model = state.menungguVerifikasiModelObj;
        if (model == null) {
          return const Center(
            child: Text("Data tidak tersedia."),
          );
        }

        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray5001,
            body: SingleChildScrollView(
              // Membungkus dengan SingleChildScrollView
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 20.h),
                child: Column(
                  children: [
                    _buildVerificationHeader(context),
                    SizedBox(height: 18.h),
                    _buildBookingDetailsSection(context),
                    SizedBox(height: 8.h),
                    _buildDetailPesananCard(context, model),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailPesananCard(
      BuildContext context, MenungguVerifikasiModel model) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 14.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder14,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.04),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(0, 2),
          ),
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
            namaBaris: "lbl_no_pesanan".tr,
            isiBaris: model.idPesanan.toString(),
          ),
          _buildOrderDateRow(
            context,
            namaBaris: "msg_tanggal_pesanan".tr,
            isiBaris: model.tanggalPesanan.toString(),
          ),
          _buildOrderDateRow(
            context,
            namaBaris: "lbl_nama_pemesan".tr,
            isiBaris: model.namaPemesan.toString(),
          ),
          _buildOrderDateRow(
            context,
            namaBaris: "lbl_total_anggota".tr,
            isiBaris: model.totalAnggota.toString(),
          ),
          _buildOrderDateRow(
            context,
            namaBaris: "lbl_total_harga".tr,
            isiBaris: model.totalHarga.toString(),
          ),
          SizedBox(height: 28.h),
          Text(
            "msg_pesanan_akan_diverifikasi".tr,
            style: CustomTextStyles.labelMediumGray50002,
          ),
          SizedBox(height: 10.h),
          CustomElevatedButton(
            height: 48.h,
            text: "msg_batalkan_pesanan".tr.toUpperCase(),
            buttonStyle: CustomButtonStyles.fillRed2,
            buttonTextStyle: theme.textTheme.labelLarge!,
            onPressed: () {
              onTapBatal(context);
            },
          ),
          SizedBox(height: 10.h),
          CustomOutlinedButton(
            text: "lbl_kembali_ke_home".tr.toUpperCase(),
            onPressed: () {
              onTapKembalikehome(context);
            },
          ),
          SizedBox(height: 6.h),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildVerificationHeader(BuildContext context) {
    return Container(
      color: Colors.transparent, // Temporary background color for visibility
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0), // Add some padding if needed
            child: GestureDetector(
              onTap: () {
                onTapImgArrowdownone(context);
              },
              child: Icon(
                Icons.arrow_back, // Use a default back arrow icon for testing
                size: 24, // Set size explicitly
                color: Colors.black, // Ensure visibility
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.only(right: 24.0), // Adjust padding if needed
                child: Text(
                  "lbl_verifikasi".tr,
                  style: CustomTextStyles.titleMediumGray900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
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
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "lbl_1".tr,
                          style: CustomTextStyles.titleMediumOnPrimary_2,
                        )
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
                        )
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

  /// Common widget
  Widget _buildOrderDateRow(
    BuildContext context, {
    required String namaBaris,
    required String isiBaris,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          namaBaris,
          style: CustomTextStyles.titleMediumGray50003.copyWith(
            color: appTheme.gray50003,
          ),
        ),
        Text(
          isiBaris,
          style: CustomTextStyles.titleMediumGray50003.copyWith(
            color: appTheme.gray50003,
          ),
        ),
      ],
    );
  }

  /// Navigates to the berandaScreen when the action is triggered.
  void onTapImgArrowdownone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.berandaScreen,
    );
  }

  /// Navigates to the berandaScreen when the action is triggered.
  void onTapKembalikehome(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.berandaScreen,
    );
  }

  void onTapBatal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Apakah Anda yakin ingin membatalkan pesanan ini?",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup pop-up tanpa keluar
              },
              child: Text("TIDAK"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup pop-up
                Navigator.of(context)
                    .pushNamed(AppRoutes.pesananDibatalkanScreen);
              },
              child: Text(
                "YA",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
