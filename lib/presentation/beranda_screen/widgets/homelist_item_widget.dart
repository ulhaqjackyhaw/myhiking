import 'package:flutter/material.dart';
import 'package:myhiking/api/api_service.dart';
import 'package:myhiking/presentation/detail_mountain_screen/bloc/detail_mountain_bloc.dart';
import 'package:myhiking/presentation/detail_mountain_screen/detail_mountain_screen.dart';
import '../../../core/app_export.dart';
import '../models/homelist_item_model.dart';

// ignore_for_file: must_be_immutable
class HomelistItemWidget extends StatelessWidget {
  HomelistItemWidget(this.homelistItemModelObj, {super.key});

  HomelistItemModel homelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    // Membuat URL dasar untuk gambar
    // String baseUrl =
    //     'http://localhost:8000/storage/images/'; // Atur URL dasar yang benar di sini
    String imageUrl = (homelistItemModelObj.gambar ??
        ''); // Menggabungkan base URL dengan nama gambar

    // print(homelistItemModelObj);

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
                    // if (homelistItemModelObj.namaGunung! == "Gunung Slamet") {
                    //   onTapImgSlamet(context);
                    // }
                    onTapImgGunung(context, homelistItemModelObj);
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
          // Menampilkan nama provinsi atau pesan error
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              homelistItemModelObj?.province?.name ?? 'Provinsi Tidak Tersedia',
              style: CustomTextStyles.bodyMediumGray600,
            ),
          ),
        ],
      ),
    );
  }
}

// onTapImgSlamet(BuildContext context) {
//   NavigatorService.pushNamed(AppRoutes.detailMountainScreen);
// }

// Fungsi untuk menangani onTap dan mengarahkan ke halaman detail gunung
onTapImgGunung(BuildContext context, HomelistItemModel homelistItemModelObj) {
  final idGunung =
      homelistItemModelObj.id; // Mengambil mountainId dari objek model

  if (idGunung != null) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => DetailMountainBloc(ApiService())
            ..add(DetailMountainInitialEvent(idGunung)),
          child: DetailMountainScreen(idGunung: idGunung),
        ),
      ),
    );
  } else {
    // Tindakan jika mountainId tidak ditemukan
    print('Mountain ID tidak ditemukan');
  }
}
