import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myhiking/api/api_service.dart';
import 'package:myhiking/models/model.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'bloc/route_bloc.dart';
import 'models/route_model.dart';

class RouteScreen extends StatelessWidget {
  final int? jalurId;
  final int? idGunung;

  const RouteScreen({super.key, this.jalurId, this.idGunung});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouteBloc(apiService: ApiService())
        ..add(RouteInitialEvent(jalurId: jalurId!, idGunung: idGunung!)),
      child: BlocBuilder<RouteBloc, RouteState>(
        builder: (context, state) {
          // Handle loading state
          if (state.isLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              ),
            );
          }

          // Handle error state
          if (state.errorMessage != null) {
            return Scaffold(
              body: Center(
                child: Text(
                  'Error: ${state.errorMessage}',
                  style: CustomTextStyles.bodyMediumGray500,
                ),
              ),
            );
          }

          // Ensure data is not null
          if (state.jalur == null || state.gunung == null) {
            return Scaffold(
              body: Center(
                child: Text(
                  'Detail jalur tidak tersedia.',
                  style: CustomTextStyles.bodyMediumGray500,
                ),
              ),
            );
          }

          // Membuat instance ResDetailRouteCentres
          final resDetailRouteCentres = ResDetailRouteCentres(
            status: true,
            message: "Success",
            jalur: state.jalur!,
            gunung: state.gunung!,
          );

          // Membuat RouteModel menggunakan ResDetailRouteCentres
          final routeModel =
              RouteModel.fromResDetailRouteCentres(resDetailRouteCentres);

          // Main UI
          return SafeArea(
            child: Scaffold(
              backgroundColor: appTheme.gray50,
              body: Stack(
                children: [
                  // Header Section (Placed in the background)
                  _buildHeaderSection(context, routeModel),

                  // Content Section (with route details, actions, and buttons at the bottom)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.h,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onPrimary,
                          borderRadius: BorderRadiusStyle.customBorderTL30,
                          boxShadow: [
                            BoxShadow(
                              color: appTheme.black900.withOpacity(0.05),
                              spreadRadius: 1.h,
                              blurRadius: 4.h,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Route Details Section
                            _buildRouteDetailSection(context, routeModel),

                            SizedBox(height: 20.h),

                            // Route Actions Section
                            _buildRouteActions(context, routeModel),

                            SizedBox(height: 16.h),

                            // Buttons: Tata Tertib & Pesan Sekarang
                            _buildTataTertibButton(context),
                            SizedBox(height: 8.h),
                            _buildPesanSekarangButton(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// **Header Section with Image**
  Widget _buildHeaderSection(BuildContext context, RouteModel routeModel) {
    final imageUrl = routeModel.gambar ??
        'assets/images/placeholder.png'; // Default placeholder image

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.h),
          bottomRight: Radius.circular(16.h),
        ),
      ),
      child: Stack(
        children: [
          // Image with proper height and fit
          ClipRRect(
            // borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(16.h),
            //   bottomRight: Radius.circular(16.h),
            // ),
            child: Image.network(
              imageUrl,
              height: 600.h, // Adjusted height as per the second image
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Back button positioned at the top-left
          Positioned(
            top: 16.h,
            left: 16.h,
            child: CustomIconButton(
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(8.h),
              onTap: () {
                Navigator.pop(context);
              },
              child: CustomImageView(
                imagePath: ImageConstant.imgIconArrowOnprimarycontainer,
              ),
            ),
          ),
          // Information Box (white background) below the image
        ],
      ),
    );
  }

  // **Route Details Section**
  Widget _buildRouteDetailSection(BuildContext context, RouteModel routeModel) {
    return Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadiusStyle.roundedBorder10,
          // boxShadow: [
          //   BoxShadow(
          //     color: appTheme.black900.withOpacity(0.1),
          //     blurRadius: 4.h,
          //     offset: Offset(0, 2.h),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Membuat Row untuk gambar dan teks berada di samping
            Row(
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Memastikan gambar dan teks sejajar di tengah
              children: [
                // Gambar lokasi
                CustomImageView(
                  imagePath: ImageConstant.imgLinkedin,
                  height: 24.h, // Memperbesar ukuran gambar
                  width: 24.h, // Sesuaikan agar gambar lebih besar
                  margin: EdgeInsets.only(
                      right: 8.h), // Memberikan jarak antara gambar dan teks
                ),
                // Nama jalur
                Text(
                  routeModel.name,
                  style: CustomTextStyles.titleLargePrimaryBlack.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20, // Menyesuaikan ukuran font untuk nama jalur
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Menampilkan lokasi
            Text(
              "${routeModel.location}",
              style: CustomTextStyles.bodyMediumGray500,
            ),
          ],
        ));
  }

  // **Route Actions Section**
  Widget _buildRouteActions(BuildContext context, RouteModel routeModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary, // Latar belakang tombol
              borderRadius:
                  BorderRadius.circular(8), // Penyesuaian bentuk tombol
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Bayangan halus
                  offset: Offset(0, 4), // Posisi bayangan
                  blurRadius: 8, // Ukuran bayangan
                  spreadRadius: 1, // Penyebaran bayangan
                ),
              ],
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Penyesuaian bentuk tombol
                ),
              ),
              onPressed: () {
                // Action to view location
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,
                      color: theme.colorScheme.primary, size: 35),
                  SizedBox(width: 8),
                  Text(
                      "Jarak\n${routeModel.distance} km", // Teks dengan dua baris
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.labelMediumPrimary10.copyWith(
                          fontSize:
                              17) // Menggunakan CustomTextStyle untuk teks
                      ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16.h),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Latar belakang putih
              borderRadius:
                  BorderRadius.circular(8), // Penyesuaian bentuk tombol
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Bayangan halus
                  offset: Offset(0, 4), // Posisi bayangan
                  blurRadius: 8, // Ukuran bayangan
                  spreadRadius: 1, // Penyebaran bayangan
                ),
              ],
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Penyesuaian bentuk tombol
                ),
              ),
              onPressed: () {
                // Action to open map
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map, color: theme.colorScheme.primary, size: 35),
                  SizedBox(width: 8),
                  Text("Open\nMaps", // Teks tombol
                      style: CustomTextStyles.labelMediumPrimary10
                          .copyWith(fontSize: 17)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // **Tata Tertib Button**
  Widget _buildTataTertibButton(BuildContext context) {
    return CustomElevatedButton(
      height: 56.h,
      text: "Tata Tertib dan",
      margin: EdgeInsets.only(right: 2.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder14,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.08),
            spreadRadius: 1.h,
            blurRadius: 2.h,
            offset: const Offset(2, 2),
          ),
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
      buttonTextStyle: CustomTextStyles.labelLargePrimarySemiBold,
      onPressed: () {
        NavigatorService.pushNamed(AppRoutes.tataTertibScreen);
      },
    );
  }

  // **Pesan Sekarang Button**
  Widget _buildPesanSekarangButton(BuildContext context) {
    return CustomElevatedButton(
      height: 56.h,
      text: "Pesan Sekarang",
      buttonStyle: CustomButtonStyles.outlineBlackTL14,
      buttonTextStyle: CustomTextStyles.titleLarge_1,
      onPressed: () {
        NavigatorService.pushNamed(AppRoutes.bookingScreen);
      },
    );
  }
}
