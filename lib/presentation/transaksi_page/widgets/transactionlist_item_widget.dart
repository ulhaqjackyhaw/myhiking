import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../models/transactionlist_item_model.dart';
import '../../pop_up_checkout_dialog/pop_up_checkout_dialog.dart';

class TransactionlistItemWidget extends StatelessWidget {
  TransactionlistItemWidget(
    this.transactionlistItemModelObj, {
    super.key,
    this.onTapRecentclimbing,
  });

  final TransactionlistItemModel transactionlistItemModelObj;
  final VoidCallback? onTapRecentclimbing;

  @override
  Widget build(BuildContext context) {
    // Parsing tanggal setelah objek tersedia
    DateTime? tanggal;
    try {
      tanggal = DateTime.parse(transactionlistItemModelObj.waktuPembayaran ?? '');
    } catch (_) {
      tanggal = null;
    }

    // Debug log untuk memastikan data diterima
    print('Membangun TransactionlistItemWidget untuk ID: ${transactionlistItemModelObj.id}');

    return GestureDetector(
      onTap: () {
        onTapRecentclimbing?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary ?? Colors.white,
          borderRadius: BorderRadiusStyle.roundedBorder6,
          boxShadow: [
            BoxShadow(
              color: appTheme.blueGray40019 ?? Colors.grey.withOpacity(0.2),
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // Format tanggal jika tersedia
                    tanggal != null
                        ? DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(tanggal)
                        : 'Tanggal tidak valid',
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    transactionlistItemModelObj.gunung ?? 'Gunung tidak diketahui',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            _buildStatusButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton(BuildContext context) {
    String status = transactionlistItemModelObj.status?.toLowerCase() ?? '';

    // Handle the status by displaying the correct button
    switch (status) {
      case 'unverified':
        return _buildProsesButton(context);
      case 'verified':
        return _buildSelesaiButton(context);
      default:
        return Text('Status tidak dikenal', style: TextStyle(color: Colors.red));
    }
  }

  Widget _buildProsesButton(BuildContext context) {
  return CustomElevatedButton(
    height: 26.h,
    width: 98.h,
    text: "Proses".tr,
    buttonStyle: CustomButtonStyles.outlineTeal1,
    buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
    onPressed: () {
      final pesananId = transactionlistItemModelObj.pesananId; // Ambil id_pesanan
      if (pesananId == null) {
        print('Pesanan ID tidak valid');
        return;
      }

      NavigatorService.pushNamed(
        AppRoutes.menungguVerifikasiScreen,
        arguments: pesananId,
      );
      print('Navigasi ke Menunggu Verifikasi Screen dengan Pesanan ID: $pesananId');
    },
  );
}

// Widget _buildProsesButton(BuildContext context) {
//   return CustomElevatedButton(
//     height: 26.h,
//     width: 98.h,
//     text: "Proses".tr,
//     buttonStyle: CustomButtonStyles.outlineTeal1,
//     buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
//     onPressed: () {
//       NavigatorService.pushNamed(
//         AppRoutes.menungguVerifikasiScreen,
//       );
//       print('Navigasi ke Menunggu Verifikasi Screen tanpa argumen');
//     },
//   );
// }


Widget _buildSelesaiButton(BuildContext context) {
  return CustomElevatedButton(
    height: 26.h,
    width: 98.h,
    text: "Check In".tr,
    buttonStyle: CustomButtonStyles.outlineTeal,
    buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
    onPressed: () {
      final pesananId = transactionlistItemModelObj.pesananId; // Ambil id_pesanan
      if (pesananId == null) {
        print('Pesanan ID tidak valid');
        return;
      }

      NavigatorService.pushNamed(
        AppRoutes.tiketScreen,
        arguments: pesananId,
      );
      print('Navigasi ke Tiket Screen dengan Pesanan ID: $pesananId');
    },
  );
}



  

  // Method to show checkout dialog
  
  }

