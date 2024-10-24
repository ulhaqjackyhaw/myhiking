import 'package:flutter/material.dart';
import 'package:myhiking/presentation/beranda_screen/bloc/beranda_bloc.dart';
import 'package:myhiking/presentation/detail_mountain_screen/detail_mountain_screen.dart';
import 'package:myhiking/presentation/sukses_screen/sukses_screen.dart';
import '../../../core/app_export.dart';
import '../models/homelist_item_model.dart';

// ignore_for_file: must_be_immutable
class HomelistItemWidget extends StatelessWidget {
  HomelistItemWidget(this.homelistItemModelObj, {super.key});

  HomelistItemModel homelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          SizedBox(
            height: 172.h,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 8.h,
                    ),
                    child: Text(
                      homelistItemModelObj.malangcentral!,
                      style: CustomTextStyles.bodySmallInterGray40002,
                    ),
                  ),
                ),
                // Membungkus CustomImageView dengan InkWell untuk mendeteksi onTap
                InkWell(
                  onTap: () {
                    // Hanya gambar tertentu yang bisa diklik
                    if (homelistItemModelObj.gunungmerbabu! ==
                        "Gunung Slamet") {
                      // Navigasi hanya jika gambar adalah Gunung Merbabu
                      onTapImgSlamet(context);
                    }
                    // } else {
                    //   // Jika bukan gambar yang diizinkan, tampilkan pesan atau lakukan sesuatu
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('Gambar ini tidak bisa diklik')),
                    //   );
                    // }
                  },
                  child: CustomImageView(
                    imagePath: homelistItemModelObj.image!,
                    height: 172.h,
                    width: double.maxFinite,
                    radius: BorderRadius.circular(20.h),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              homelistItemModelObj.gunungmerbabu!,
              style: theme.textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              homelistItemModelObj.jawatengah!,
              style: CustomTextStyles.bodyMediumGray600,
            ),
          ),
        ],
      ),
    );
  }
}

onTapImgSlamet(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.detailMountainScreen);
  }
