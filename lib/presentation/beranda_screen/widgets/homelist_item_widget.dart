import 'package:flutter/material.dart';
import 'package:myhiking/api/api_service.dart';
import 'package:myhiking/presentation/detail_mountain_screen/bloc/detail_mountain_bloc.dart';
import 'package:myhiking/presentation/detail_mountain_screen/detail_mountain_screen.dart';
import 'package:myhiking/presentation/pop_up_lengkapi_data_diri_dialog/pop_up_lengkapi_data_diri_dialog.dart';
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
Future<void> onTapImgGunung(
    BuildContext context, HomelistItemModel homelistItemModelObj) async {
  final idGunung = homelistItemModelObj.id;

  if (idGunung != null) {
    final token = await ApiService().getToken();

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Silahkan login terlebih dahulu')),
      );
      return;
    }

    try {
      final response = await ApiService().getUser(token);

      if (response['success']) {
        final userData = response['data'];
        final userId = userData['id'];

        if (userData['nik'] == null ||
            userData['phone'] == null ||
            userData['emergency_phone'] == null ||
            userData['address'] == null ||
            userData['nik'].toString().isEmpty ||
            userData['phone'].toString().isEmpty ||
            userData['emergency_phone'].toString().isEmpty ||
            userData['address'].toString().isEmpty) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: PopUpLengkapiDataDiriDialog(
                userId: userData['id'],
              ),
            ),
          );
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => DetailMountainBloc(apiService: ApiService())
                ..add(DetailMountainInitialEvent(idGunung)),
              child: DetailMountainScreen(idGunung: idGunung),
            ),
          ),
        );
      }
    } catch (e) {
      print('Error getting user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan saat mengambil data user')),
      );
    }
  } else {
    print('Mountain ID tidak ditemukan');
  }
}
