import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/routelistsection_item_model.dart';

// ignore_for_file: must_be_immutable
class RoutelistsectionItemWidget extends StatelessWidget {
  RoutelistsectionItemWidget(this.routelistsectionItemModelObj, {super.key});

  RoutelistsectionItemModel routelistsectionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 145.h,
        padding: EdgeInsets.symmetric(
          horizontal: 45.h,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadiusStyle.roundedBorder10,
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withOpacity(0.08),
              spreadRadius: 1.h,
              blurRadius: 2.h,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Menampilkan tinggi dari model
            Text(
              routelistsectionItemModelObj.jarak! as String,
              style: CustomTextStyles.labelLargeInterGray500,
            ),
            SizedBox(height: 1.h),
            // Menampilkan nama dari model
            Text(
              routelistsectionItemModelObj.nama ?? "Nama Tidak Tersedia",
              style: CustomTextStyles.labelLargeInterGray500,
            ),
            SizedBox(height: 1.h),
            // Menampilkan lokasi dari model
            Text(
              routelistsectionItemModelObj.province ?? "Lokasi Tidak Tersedia",
              style: CustomTextStyles.labelLargeInterGray500,
            ),
          ],
        ),
      ),
    );
  }
}
