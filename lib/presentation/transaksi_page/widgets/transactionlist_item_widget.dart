import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../models/transactionlist_item_model.dart';

// ignore_for_file: must_be_immutable
class TransactionlistItemWidget extends StatelessWidget {
  final VoidCallback? onChangeStatus;

  TransactionlistItemWidget(
    this.transactionlistItemModelObj, {
    super.key,
    this.onTapRecentclimbing,
    this.onChangeStatus, // Inisialisasi callback ini
  });

  TransactionlistItemModel transactionlistItemModelObj;
  VoidCallback? onTapRecentclimbing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Jika status adalah "Selesai", navigasi ke tiket
        if (transactionlistItemModelObj.status == "Selesai") {
          NavigatorService.pushNamed(AppRoutes.tiketScreen);
        }
        // Panggil callback jika ada
        onTapRecentclimbing?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadiusStyle.roundedBorder6,
          boxShadow: [
            BoxShadow(
              color: appTheme.blueGray40019,
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: const Offset(
                0,
                13,
              ),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactionlistItemModelObj.senintwentyseve!,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        transactionlistItemModelObj.gunungslamet!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildStatusButton(context),
          ],
        ),
      ),
    );
  }

  /// Menampilkan tombol sesuai status transaksi
  /// Menampilkan tombol sesuai status transaksi
  Widget _buildStatusButton(BuildContext context) {
    if (transactionlistItemModelObj.status == "Proses") {
      return CustomElevatedButton(
        height: 26.h,
        width: 98.h,
        text: "Proses".tr,
        buttonStyle: CustomButtonStyles.outlineTeal1,
        buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
        onPressed: () {
          onChangeStatus?.call(); // Panggil callback saat tombol ditekan
        },
      );
    } else if (transactionlistItemModelObj.status == "Berhasil") {
      return _buildBerhasilButton(context);
    } else {
      return _buildSelesaiButton(context);
    }
  }

  /// Section Widget
  Widget _buildProsesButton(BuildContext context) {
    return CustomElevatedButton(
      height: 26.h,
      width: 98.h,
      text: "Proses".tr,
      buttonStyle: CustomButtonStyles.outlineTeal1,
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
      onPressed: () {
        // Logika untuk mengubah status menjadi "Berhasil"
        transactionlistItemModelObj.status = "Berhasil";
        // Panggil untuk navigasi
        NavigatorService.pushNamed(AppRoutes.suksesScreen);
      },
    );
  }

  Widget _buildBerhasilButton(BuildContext context) {
    return CustomElevatedButton(
      height: 26.h,
      width: 98.h,
      text: "lbl_berhasil".tr,
      buttonStyle: CustomButtonStyles.outlineTeal,
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
      onPressed: () {
        // Navigasi ke sukses screen
        NavigatorService.pushNamed(AppRoutes.suksesScreen);
      },
    );
  }

  Widget _buildSelesaiButton(BuildContext context) {
    return CustomElevatedButton(
      height: 26.h,
      width: 98.h,
      text: "lbl_selesai".tr,
      buttonStyle: CustomButtonStyles.outlineTeal2,
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
      onPressed: () {
        // Navigasi ke tiket screen
        NavigatorService.pushNamed(AppRoutes.tiketScreen);
      },
    );
  }
}
