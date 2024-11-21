import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myhiking/api/api_service.dart';
import 'package:myhiking/models/model.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'bloc/route_bloc.dart';
import 'models/route_model.dart';
import 'models/routelistsection_item_model.dart';
import 'widgets/routelistsection_item_widget.dart';

class RouteScreen extends StatefulWidget {
  final int? jalurId;
  final int? idGunung;

  const RouteScreen({super.key, this.jalurId, this.idGunung});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  bool isLoading = false;
  Jalur? jalurCentre;
  // List<Jalur> jalurCentre = [];
  String errorMessage = '';

  // get jalurId => null;
  // Future<List<Jalur>> getJalurCentres() async {
  //   try {
  //     setState(() {
  //       isLoading = true; // Set loading state to true
  //     });

  //     String? token = await ApiService().getToken();
  //     if (token == null) {
  //       throw Exception('Token not found');
  //     }

  //     // Panggil API untuk mendapatkan data jalur
  //     final response = await http.get(
  //       Uri.parse(
  //           "$baseUrl/gunung/${widget.idGunung}/jalur/${widget.jalurId}"), // Menggunakan idGunung untuk menentukan URL API
  //       headers: {'Authorization': 'Bearer $token'},
  //     );

  //     // Pastikan status code adalah 200
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         // Parsing response body menjadi model yang sesuai dan mengembalikan list jalur
  //         List<Jalur> jalurList = (jsonDecode(response.body)['data'] as List)
  //             .map((item) => Jalur.fromJson(item))
  //             .toList();

  //         // Menyimpan data jalur ke dalam variabel jalurCentre
  //         jalurCentre = jalurList;
  //         isLoading = false; // Set loading state to false
  //       });

  //       return jalurCentre; // Mengembalikan list jalur
  //     } else {
  //       throw Exception('Failed to fetch route centres');
  //     }
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false; // Set loading state to false on error
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(e.toString()),
  //         backgroundColor: Colors.red,
  //       ),
  //     );

  //     return []; // Mengembalikan list kosong jika terjadi error
  //   }
  // }
  Future<void> getJalurCentres() async {
    try {
      setState(() {
        isLoading = true;
      });
      String? token = await ApiService().getToken();
      if (token == null) {
        throw Exception('Token not found');
      }
      http.Response res = await http.get(
        Uri.parse("$baseUrl/gunung/${widget.idGunung}/jalur/${widget.jalurId}"),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (res.statusCode == 200) {
        setState(() {
          jalurCentre = Jalur.fromJson(jsonDecode(res.body)['data']);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load field centre details');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.green,
          ),
        );
      });
      print('Error: $e'); // Menampilkan error di terminal
    }
  }

  // Future<Jalur?> getJalurCentres() async {
  //   final String url =
  //       "$baseUrl/gunung/${widget.idGunung}/jalur/${widget.jalurId}"; // URL API yang sesuai

  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     print('Response status: ${response.statusCode}'); // Log status code
  //     print('Response body: ${response.body}'); // Log response body

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = json.decode(response.body);

  //       // Cek apakah status API adalah true
  //       if (responseData['status'] == true) {
  //         // Mengembalikan data jalur sebagai objek
  //         return Jalur.fromJson(responseData['jalur']);
  //       } else {
  //         throw Exception(
  //             'Gagal mengambil data jalur: ${responseData['message']}');
  //       }
  //     } else {
  //       throw Exception(
  //           'Gagal memuat data jalur, status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error: $e'); // Log error
  //     throw Exception('Terjadi kesalahan: $e');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // Bisa memanggil getjalurCentres() disini jika perlu
    if (widget.jalurId != null && widget.idGunung != null) {
      context.read<RouteBloc>().add(RouteInitialEvent(jalurId: widget.jalurId));
    }
    // if (widget.jalurId != null && widget.idGunung != null) {
    //   _loadJalurData(widget.idGunung!,
    //       widget.jalurId!); // Panggil dengan idGunung dan jalurId yang valid
    // }
    // _getJalurDetails();
  }

  // Future<void> _loadJalurData(int idGunung, int jalurId) async {
  //   try {
  //     var data = await getJalurCentres(); // Ambil data jalur
  //     setState(() {
  //       jalurCentre = data; // Perbarui jalurCentre dengan data yang diterima
  //     });
  //   } catch (e) {
  //     print('Error saat memuat data jalur: $e');
  //     // Anda bisa menampilkan error atau memberikan fallback di sini
  //   }
  // }

  // // Fungsi untuk mengambil data jalur
  // Future<void> getjalurCentres() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     String? token = await ApiService().getToken();
  //     if (token == null) {
  //       throw Exception('Token not found');
  //     }
  //     // Panggil API untuk mendapatkan data
  //     http.Response res = await http.get(
  //       Uri.parse("$baseUrl/gunung/${widget.idGunung}/Jalur/${widget.jalurId}"),
  //       headers: {'Authorization': 'Bearer $token'},
  //     );

  //     // Pastikan Anda memiliki metode yang mengubah body JSON menjadi objek
  //     List<Jalur>? data = resRouteCentresFromJson(res.body).data;

  //     setState(() {
  //       isLoading = false;
  //       jalurCentre = data?.first;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(e.toString()),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getjalurCentres(); // Panggil fungsi untuk mendapatkan data jalur
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.gray50,
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.gray50,
            image: DecorationImage(
              image: AssetImage(ImageConstant.imgRoute),
              fit: BoxFit.fill,
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    _buildIconSection(context),
                    SizedBox(height: 240.h),
                    _buildDividerSection(context),
                    SizedBox(height: 8.h),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.h,
                        vertical: 14.h,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary,
                        borderRadius: BorderRadiusStyle.customBorderTL30,
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
                          // Ganti bagian ini
                          _buildContactInfoSection(context),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 14.h),
                              child: Text(
                                "msg_dipajaya_rt_01_rw_01".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodySmallGray50003
                                    .copyWith(
                                  height: 2.00,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),

                          // Tambahkan Row untuk tombol "Jarak 5km" dan "Open Maps"
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomElevatedButton(
                                    height: 75.h,
                                    text: "",
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 135, 171, 136),
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder14,
                                      boxShadow: [
                                        BoxShadow(
                                          color: appTheme.black900
                                              .withOpacity(0.08),
                                          spreadRadius: 1.h,
                                          blurRadius: 2.h,
                                          offset: const Offset(2, 2),
                                        )
                                      ],
                                    ),
                                    buttonStyle:
                                        CustomButtonStyles.outlineBlack,
                                    buttonTextStyle: CustomTextStyles
                                        .bodySmallGray50003
                                        .copyWith(fontSize: 15),
                                    leftIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.location_on,
                                            color: theme.colorScheme.primary,
                                            size: 35),
                                        const SizedBox(
                                            width:
                                                13.0), // Jarak horizontal antara icon dan teks
                                        Text(
                                            jalurCentre?.jarak.toString() ??
                                                "Data tidak tersedia",
                                            style: CustomTextStyles
                                                .labelMediumPrimary10
                                                .copyWith(fontSize: 17)),
                                      ],
                                    )),
                              ),
                              SizedBox(width: 20.h), // Spasi antar tombol
                              Expanded(
                                child: CustomElevatedButton(
                                    height: 75.h,
                                    text: "",
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 135, 171, 136),
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder14,
                                      boxShadow: [
                                        BoxShadow(
                                          color: appTheme.black900
                                              .withOpacity(0.08),
                                          spreadRadius: 1.h,
                                          blurRadius: 2.h,
                                          offset: const Offset(2, 2),
                                        )
                                      ],
                                    ),
                                    buttonStyle:
                                        CustomButtonStyles.outlineBlack,
                                    buttonTextStyle: CustomTextStyles
                                        .bodySmallGray50003
                                        .copyWith(fontSize: 15),
                                    onPressed: () {
                                      // Aksi untuk tombol Open Maps
                                    },
                                    leftIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.map,
                                            color: theme.colorScheme.primary,
                                            size: 35),
                                        const SizedBox(
                                            width:
                                                13.0), // Jarak horizontal antara icon dan teks
                                        Text("Open\nMaps",
                                            style: CustomTextStyles
                                                .labelMediumPrimary10
                                                .copyWith(fontSize: 17)),
                                      ],
                                    )),
                              ),
                            ],
                          ),

                          _buildRouteListSection(context),
                          SizedBox(height: 18.h),
                          CustomElevatedButton(
                            height: 56.h,
                            text: "msg_tata_tertib_dan".tr,
                            margin: EdgeInsets.only(right: 2.h),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onPrimary,
                              borderRadius: BorderRadiusStyle.roundedBorder14,
                              // border: Border.all(
                              //   color: theme.colorScheme.primaryContainer,
                              //   width: 1.h,
                              // ),
                              boxShadow: [
                                BoxShadow(
                                  color: appTheme.black900.withOpacity(0.08),
                                  spreadRadius: 1.h,
                                  blurRadius: 2.h,
                                  offset: const Offset(2, 2),
                                )
                              ],
                            ),
                            leftIcon: Container(
                              margin: EdgeInsets.only(right: 16.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgVideocamera,
                                height: 24.h,
                                width: 24.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            buttonStyle: CustomButtonStyles.outlineBlack,
                            buttonTextStyle:
                                CustomTextStyles.labelLargePrimarySemiBold,
                            onPressed: () {
                              onTapTatatertibdan(context);
                            },
                          ),
                          SizedBox(height: 8.h),
                          CustomElevatedButton(
                            height: 75.h,
                            text: "lbl_pesan_sekarang".tr,
                            margin: EdgeInsets.only(right: 2.h),
                            buttonStyle: CustomButtonStyles.outlineBlackTL14,
                            buttonTextStyle: CustomTextStyles.titleLarge_1,
                            onPressed: () {
                              onTapPesansekarang(context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //

  /// Section Widget
  Widget _buildIconSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(
        left: 24.h,
        top: 8.h,
        bottom: 8.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconButton(
            height: 40.h,
            width: 40.h,
            padding: EdgeInsets.all(8.h),
            onTap: () {
              onTapBtnIconarrowone(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgIconArrowOnprimarycontainer,
            ),
          ),
          SizedBox(height: 64.h)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDividerSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.only(right: 144.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 4.h,
            width: 32.h,
            decoration: BoxDecoration(
              color: appTheme.gray30001,
              borderRadius: BorderRadius.circular(2.h),
            ),
          )
        ],
      ),
    );
  }

  //Section Widget
  // Widget _buildContactInfoSection(BuildContext context) {
  //   print(
  //       'Jumlah jalurCentre: ${jalurCentre.length}'); // Debug print untuk memeriksa data
  //   if (jalurCentre.isEmpty) {
  //     // Jika list kosong, tampilkan pesan fallback
  //     return Center(
  //       child: Text(
  //         'Tidak ada data jalur yang tersedia',
  //         style: CustomTextStyles.titleLargePrimaryBlack,
  //       ),
  //     );
  //   }

  //   // Gunakan ListView.builder untuk menampilkan semua jalur
  //   return Container(
  //     width: double.maxFinite,
  //     margin: EdgeInsets.symmetric(horizontal: 14.h),
  //     child: ListView.builder(
  //       shrinkWrap: true, // Sesuaikan ukuran list sesuai item
  //       itemCount: jalurCentre.length, // Jumlah item yang ingin ditampilkan
  //       itemBuilder: (context, index) {
  //         Jalur jalur =
  //             jalurCentre[index]; // Ambil model jalur berdasarkan index
  //         return Container(
  //           margin: EdgeInsets.symmetric(
  //               vertical: 8.h), // Memberikan spasi antar item
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               CustomImageView(
  //                 imagePath: ImageConstant
  //                     .imgLinkedin, // Ganti dengan gambar jalur jika ada
  //                 height: 14.h,
  //                 width: 12.h,
  //                 margin: EdgeInsets.only(top: 6.h),
  //               ),
  //               SizedBox(width: 16.h),
  //               Expanded(
  //                 child: Text(
  //                   jalur.nama, // Tampilkan nama jalur
  //                   style: CustomTextStyles.titleLargePrimaryBlack,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
  Widget _buildContactInfoSection(BuildContext context) {
    if (jalurCentre == null) {
      // Menampilkan error pada terminal jika jalurCentre null
      print('Error: Tidak ada data jalur yang tersedia');
      return Center(
        child: Text(
          'Tidak ada data jalur yang tersedia',
          style: CustomTextStyles.titleLargePrimaryBlack,
        ),
      );
    }

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 14.h),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant
                  .imgLinkedin, // Ganti dengan gambar jalur jika ada
              height: 14.h,
              width: 12.h,
              margin: EdgeInsets.only(top: 6.h),
            ),
            SizedBox(width: 16.h),
            Expanded(
              child: Text(
                jalurCentre!.nama, // Menampilkan nama jalur
                style: CustomTextStyles.titleLargePrimaryBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildContactInfoSection(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     margin: EdgeInsets.symmetric(horizontal: 14.h),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: jalurCentre.map((jalur) {
  //         return Padding(
  //           padding: EdgeInsets.only(bottom: 8.h),
  //           child: Text(
  //             jalur.nama,
  //             style: CustomTextStyles.titleLargePrimaryBlack,
  //           ),
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildRouteListSection(BuildContext context) {
    final idGunung = widget.idGunung;
    final jalurId = widget.jalurId;

    if (idGunung == null || jalurId == null) {
      return Center(
        child: Text('No mountain or route ID provided'),
      );
    }

    return Container(
      margin: EdgeInsets.only(right: 26.h),
      width: double.maxFinite,
      child: FutureBuilder<void>(
        // Menggunakan Future<void> untuk memuat data
        future: getJalurCentres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            print('Error: ${snapshot.error}'); // Log error di terminal
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (jalurCentre == null) {
            return Center(child: Text('No route available'));
          }

          // Data sudah tersedia, tampilkan detail jalur
          return _buildContactInfoSection(context);
        },
      ),
    );
  }

  //

// Fungsi yang Anda gunakan untuk mendapatkan jalur
// Future<List<Jalur>> getjalurCentres() async {
//   try {
//     setState(() {
//       isLoading = true;
//     });
//     String? token = await ApiService().getToken();
//     if (token == null) {
//       throw Exception('Token not found');
//     }
//     // Panggil API untuk mendapatkan data jalur
//     http.Response res = await http.get(
//       Uri.parse("$baseUrl/gunung/${widget.idGunung}/Jalur/${widget.jalurId}"),
//       headers: {'Authorization': 'Bearer $token'},
//     );

//     // Pastikan Anda memiliki metode yang mengubah body JSON menjadi objek
//     List<Jalur>? data = resRouteCentresFromJson(res.body).data;

//     setState(() {
//       isLoading = false;
//       jalurCentre = (data ?? []) as Jalur?;
//     });

//     return data ?? [];
//   } catch (e) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(e.toString()),
//         backgroundColor: Colors.red,
//       ),
//     );
//     return [];
//   }
// }

  /// Navigates to the detailMountainScreen when the action is triggered.
  onTapBtnIconarrowone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.berandaScreen);
  }

  /// Navigates to the tataTertibScreen when the action is triggered.
  onTapTatatertibdan(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.tataTertibScreen);
  }

  /// Navigates to the bookingScreen when the action is triggered.
  onTapPesansekarang(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.bookingScreen);
  }
}
