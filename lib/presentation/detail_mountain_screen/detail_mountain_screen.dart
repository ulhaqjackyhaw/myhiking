import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myhiking/api/api_service.dart';
import 'package:myhiking/models/model.dart';
import 'package:myhiking/presentation/route_screen/route_screen.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/detail_mountain_bloc.dart';
import 'models/detail_mountain_model.dart';

class DetailMountainScreen extends StatefulWidget {
  final int idGunung;

  // Constructor untuk menerima idGunung
  // Constructor untuk menerima idGunung
  const DetailMountainScreen({super.key, required this.idGunung});

  // Ubah builder menjadi fungsi statis yang menerima parameter idGunung
  // static Widget builder(BuildContext context, {required int idGunung}) {
  //   return DetailMountainScreen(idGunung: idGunung);
  // }

  @override
  State<DetailMountainScreen> createState() => _DetailMountainScreenState();

  // static builder(int idGunung) {}

  // @override
  // _DetailMountainScreenState createState() => _DetailMountainScreenState();
}

class _DetailMountainScreenState extends State<DetailMountainScreen> {
  bool isLoading = false;
  // Future<List<Jalur>>? _jalurFuture;
  List<Jalur> listJalur = [];
  List<Jalur> jalurCentre = [];
  Future<List<Jalur>>? _jalurFuture; // Add this line to define the future

  Future<List<Jalur>> getRouteCentres() async {
    try {
      setState(() {
        isLoading = true;
      });

      String? token = await ApiService().getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('http://localhost:8000/api/gunung/${widget.idGunung}'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        // Decode JSON response
        Map<String, dynamic> jsonData = jsonDecode(response.body);

        // Parse JSON into ResRouteCentres model
        ResRouteCentres resRouteCentres = ResRouteCentres.fromJson(jsonData);

        // Extract list of Jalur from the parsed data
        List<Jalur> jalurList = resRouteCentres.data;

        setState(() {
          isLoading = false;
          listJalur = jalurList;
          jalurCentre = listJalur;
        });

        return jalurList; // Return the list of Jalur
      } else {
        throw Exception(
            'Failed to fetch route centres: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      // Tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );

      return []; // Return an empty list in case of an error
    }
  }

  @override
  void initState() {
    super.initState();
    // Memanggil API untuk mengambil jalur berdasarkan idGunung
    _jalurFuture = getRouteCentres();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMountainBloc, DetailMountainState>(
      builder: (context, state) {
        final detailMountain = state.detailMountainModelObj;

        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray50,
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(
                    height: 396.h,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        _buildBackgroundStack(context),
                        Text(
                          detailMountain?.name ?? "Loading...", // Nama gunung
                          style: CustomTextStyles.headlineSmall_1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  if (detailMountain != null)
                    _buildElevationColumn(context, detailMountain),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: _buildRouteList(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRouteList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: FutureBuilder<List<Jalur>>(
        future: _jalurFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No routes available'));
          }

          List<Jalur> routes = snapshot.data!;

          // Menggunakan ListView.builder untuk menampilkan daftar jalur
          return ListView.builder(
            shrinkWrap: true, // Agar ListView tidak melampaui batas
            physics:
                const NeverScrollableScrollPhysics(), // Hanya scroll di dalam ScrollView
            itemCount: routes.length, // Menentukan jumlah item yang ditampilkan
            itemBuilder: (context, index) {
              // Jalur jalur = routes[index]; // Ambil jalur berdasarkan index

              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => RouteScreen(
                  //         jalurId: jalurCentre[index].id,
                  //         // Gunakan id dari jalur yang dipilih
                  //       ),
                  onTap: () {
                    // Pastikan jalur memiliki data valid
                    // if (jalur.id != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RouteScreen(
                            jalurId: jalurCentre[index]
                                .id, // Gunakan id dari jalur yang dipilih
                          ),
                        ),
                      );
                    // } else {
                    //   // Tampilkan pesan jika jalur tidak valid
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Data jalur tidak valid.'),
                    //       backgroundColor: Colors.red,
                    //     ),
                    //   );
                    // }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.h, vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child: Row(
                      children: [
                        // Menambahkan ikon di sebelah kiri teks
                        Container(
                          margin: EdgeInsets.only(right: 12.h),
                          child: CustomImageView(
                            imagePath: ImageConstant
                                .imgLinkedin, // Ganti dengan path gambar yang sesuai
                            height: 20.h,
                            width: 18.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        // Menampilkan nama jalur
                        Text(
                          jalurCentre[index].nama, // Menampilkan nama jalur
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        // Ikon panah
                        Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildBackgroundStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 372.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgBg,
              height: 372.h,
              width: double.maxFinite,
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 8.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAppBar(
                    height: 40.h,
                    leadingWidth: 64.h,
                    leading: AppbarLeadingIconbutton(
                      imagePath: ImageConstant.imgIconArrow,
                      margin: EdgeInsets.only(left: 24.h),
                      onTap: () => onTapIconarrowone(context),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.h,
                      vertical: 40.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(0.43, 0.79),
                        end: const Alignment(0.43, 0.05),
                        colors: [
                          appTheme.gray50,
                          appTheme.gray50.withOpacity(0.1)
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 22.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgMountainPicture,
                                height: 120.h,
                                width: 120.h,
                                radius: BorderRadius.circular(60.h),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildElevationColumn(
      BuildContext context, DetailMountainModel detailMountain) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 28.h, right: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_ketinggian".tr,
                      style: CustomTextStyles.bodySmallBlack900,
                    ),
                    Text(
                      "${detailMountain.height} m", // Menampilkan ketinggian dari database
                      style: CustomTextStyles.titleMediumSemiBold,
                    ),
                  ],
                ),
                CustomElevatedButton(
                  height: 42.h,
                  width: 188.h,
                  text: detailMountain
                      .province, // Menampilkan nama provinsi dari database
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 12.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgLinkedin,
                      height: 20.h,
                      width: 18.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL8,
                  buttonTextStyle: CustomTextStyles.titleMediumSemiBold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteTwo(
    BuildContext context, {
    // required String jalurGuciOne,
    Function? onTapRouteTwo,
  }) {
    return GestureDetector(
      onTap: () {
        onTapRouteTwo?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.roundedBorder6,
          boxShadow: [
            BoxShadow(
              color: appTheme.blueGray40019,
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: const Offset(0, 13),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgLinkedin,
              height: 20.h,
              width: 18.h,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: 6.h),
            ),
            const Spacer(flex: 20),
            // Text(
            //   jalurGuciOne,
            // ),
            const Spacer(flex: 79),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 24.h,
              width: 24.h,
            ),
          ],
        ),
      ),
    );
  }

// Navigates to the berandaScreen when the action is triggered.
  onTapIconarrowone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.berandaScreen,
    );
  }

  //   Future<List<Jalur>> fetchJalur(int idGunung) async {
  //   final apiService = ApiService();

  //   try {
  //     // Mengambil respons dari API
  //     final response = await apiService.fetchJalur(idGunung);

  //     // Debugging untuk memastikan respons API
  //     print('Response from API: $response');

  //     // Memeriksa apakah 'gunung' dan 'data' ada dalam respons
  //     if (response != null &&
  //         response['gunung'] != null &&
  //         response['gunung']['data'] != null) {
  //       // Membuat daftar jalur dari data yang diterima
  //       List<Jalur> listJalur = (response['gunung']['data'] as List<dynamic>)
  //           .map((item) =>
  //               Jalur.fromJson(item)) // Membuat objek Jalur untuk setiap item
  //           .toList();

  //       // Mengembalikan daftar jalur
  //       return listJalur;
  //     } else {
  //       throw Exception('Jalur data not found or empty');
  //     }
  //   } catch (e) {
  //     // Tangani kesalahan dan lempar exception
  //     print('Error fetching jalur: $e');
  //     throw Exception('Failed to fetch jalur: $e');
  //   }
  // }
}
