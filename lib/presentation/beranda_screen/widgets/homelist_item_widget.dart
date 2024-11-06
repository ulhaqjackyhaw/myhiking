// import 'package:flutter/material.dart';
// import '../../../core/app_export.dart';
// import '../models/homelist_item_model.dart';

// // ignore_for_file: must_be_immutable
// class HomelistItemWidget extends StatelessWidget {
//   HomelistItemWidget(this.homelistItemModelObj, {super.key});

//   HomelistItemModel homelistItemModelObj;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       padding: EdgeInsets.all(10.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadiusStyle.roundedBorder20,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 4.h),
//           SizedBox(
//             height: 172.h,
//             width: double.maxFinite,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       left: 12.h,
//                       top: 8.h,
//                     ),
//                     child: Text(
//                       homelistItemModelObj.namaGunung!,
//                       style: CustomTextStyles.bodySmallInterGray40002,
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     if (homelistItemModelObj.namaGunung! ==
//                         "Gunung Slamet") {
//                       onTapImgSlamet(context);
//                     }
//                   },
//                   child: CustomImageView(
//                     imagePath: homelistItemModelObj.image!,
//                     height: 172.h,
//                     width: double.maxFinite,
//                     radius: BorderRadius.circular(20.h),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 14.h),
//           Padding(
//             padding: EdgeInsets.only(left: 4.h),
//             child: Text(
//               homelistItemModelObj.namaGunung!,
//               style: theme.textTheme.titleMedium,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 4.h),
//             child: Text(
//               homelistItemModelObj.jawatengah!,
//               style: CustomTextStyles.bodyMediumGray600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// onTapImgSlamet(BuildContext context) {
//     NavigatorService.pushNamed(AppRoutes.detailMountainScreen);
//   }
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/homelist_item_model.dart';

// ignore_for_file: must_be_immutable
class HomelistItemWidget extends StatelessWidget {
  HomelistItemWidget(this.homelistItemModelObj, {super.key});

  HomelistItemModel homelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    // Membuat URL dasar untuk gambar
    String baseUrl = ''; // Atur URL dasar yang benar di sini
    String imageUrl = baseUrl +
        (homelistItemModelObj.gambar ?? ''); // Menggabungkan base URL dengan nama gambar

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
                      homelistItemModelObj.namaGunung!,
                      style: CustomTextStyles.bodySmallInterGray40002,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (homelistItemModelObj.namaGunung! == "Gunung Slamet") {
                      onTapImgSlamet(context);
                    }
                  },
                  child: Image.network(
                    imageUrl,
                    height: 172.h,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading image: $error');
                      return Container(
                        height: 172.h,
                        width: double.maxFinite,
                        color: Colors.grey,
                        child: const Center(
                          child: Text('Gambar tidak tersedia'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              homelistItemModelObj.namaGunung!,
              style: theme.textTheme.titleMedium,
            ),
          ),
          // // Menampilkan nama provinsi atau pesan error
          // Padding(
          //   padding: EdgeInsets.only(left: 4.h),
          //   child: Text(
          //     homelistItemModelObj.province!,
          //     style: CustomTextStyles.bodyMediumGray600,
          //   ),
          // ),
        ],
      ),
    );
  }
}

onTapImgSlamet(BuildContext context) {
  NavigatorService.pushNamed(AppRoutes.detailMountainScreen);
}
