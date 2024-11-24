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
              body: Column(
                children: [
                  // Header Section
                  _buildHeaderSection(context),

                  // Spacer between header and content
                  SizedBox(height: 16.h),

                  // Content Section
                  Expanded(
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

  /// **Header Section**
  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.h),
          bottomRight: Radius.circular(16.h),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 1.h,
            blurRadius: 4.h,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
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
          Text(
            "Route Details",
            style: CustomTextStyles.titleLargePrimaryBlack.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 40), // Placeholder untuk keseimbangan layout
        ],
      ),
    );
  }

  /// **Route Details Section**
  Widget _buildRouteDetailSection(BuildContext context, RouteModel routeModel) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder10,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            blurRadius: 4.h,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            routeModel.name,
            style: CustomTextStyles.titleLargePrimaryBlack.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Distance: ${routeModel.jarak} km",
            style: CustomTextStyles.bodyMediumGray500,
          ),
          SizedBox(height: 4.h),
          Text(
            "Fee: ${routeModel.biaya} IDR",
            style: CustomTextStyles.bodyMediumGray500,
          ),
          SizedBox(height: 4.h),
          Text(
            "Basecamp: ${routeModel.basecamp}",
            style: CustomTextStyles.bodyMediumGray500,
          ),
        ],
      ),
    );
  }

  /// **Route Actions Section**
  Widget _buildRouteActions(BuildContext context, RouteModel routeModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomElevatedButton(
            height: 56.h,
            text: "Lihat Lokasi",
            buttonStyle: CustomButtonStyles.fillPrimary,
            leftIcon: Icon(Icons.location_on, size: 24, color: Colors.white),
            onPressed: () {
              // Aksi Lihat Lokasi
            },
          ),
        ),
        SizedBox(width: 16.h),
        Expanded(
          child: CustomElevatedButton(
            height: 56.h,
            text: "Buka Maps",
            buttonStyle: CustomButtonStyles.fillBlueGray,
            leftIcon: Icon(Icons.map, size: 24, color: Colors.white),
            onPressed: () {
              // Aksi Buka Maps
            },
          ),
        ),
      ],
    );
  }

  /// **Tata Tertib Button**
  Widget _buildTataTertibButton(BuildContext context) {
    return CustomElevatedButton(
      height: 56.h,
      text: "Tata Tertib",
      buttonStyle: CustomButtonStyles.fillBlueGray,
      onPressed: () {
        NavigatorService.pushNamed(AppRoutes.tataTertibScreen);
      },
    );
  }

  /// **Pesan Sekarang Button**
  Widget _buildPesanSekarangButton(BuildContext context) {
    return CustomElevatedButton(
      height: 56.h,
      text: "Pesan Sekarang",
      buttonStyle: CustomButtonStyles.fillPrimary,
      onPressed: () {
        NavigatorService.pushNamed(AppRoutes.bookingScreen);
      },
    );
  }
}
