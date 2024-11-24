import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myhiking/api/api_service.dart';
import 'package:myhiking/models/model.dart';
import 'package:myhiking/presentation/route_screen/route_screen.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../route_screen/bloc/route_bloc.dart';
import 'bloc/detail_mountain_bloc.dart';
import 'models/detail_mountain_model.dart';

class DetailMountainScreen extends StatefulWidget {
  final int idGunung;

  const DetailMountainScreen({super.key, required this.idGunung});

  @override
  State<DetailMountainScreen> createState() => _DetailMountainScreenState();
}

class _DetailMountainScreenState extends State<DetailMountainScreen> {
  @override
  void initState() {
    super.initState();
    // Memicu event untuk mengambil data saat screen diinisialisasi
    context
        .read<DetailMountainBloc>()
        .add(DetailMountainInitialEvent(widget.idGunung));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMountainBloc, DetailMountainState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }

        final detailMountain = state.gunung != null
            ? DetailMountainModel.fromGunung(state.gunung!)
            : null;
        final routes = state.jalurList;

        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray50,
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildHeader(context, detailMountain),
                  SizedBox(height: 16.h),
                  if (detailMountain != null)
                    _buildElevationColumn(context, detailMountain),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: routes != null
                        ? _buildRouteList(context, routes)
                        : const Center(child: Text('No routes available')),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(
      BuildContext context, DetailMountainModel? detailMountain) {
    return SizedBox(
      height: 396.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildBackgroundStack(context),
          Text(
            detailMountain?.name ?? "Loading...",
            style: CustomTextStyles.headlineSmall_1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRouteList(BuildContext context, List<Jalur> routes) {
    if (routes.isEmpty) {
      // Tampilkan pesan jika daftar rute kosong
      return const Center(
        child: Text(
          'Tidak ada jalur tersedia',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: ListView.builder(
        shrinkWrap: true,
        physics:
            const NeverScrollableScrollPhysics(), // Non-scrollable jika dalam scroll lain
        itemCount: routes.length,
        itemBuilder: (context, index) {
          final route = routes[index];

          // Validasi properti route
          if (route.id == null || route.nama.isEmpty) {
            return const SizedBox.shrink(); // Abaikan jika data tidak valid
          }

          return GestureDetector(
            onTap: () {
              // Navigasi ke RouteScreen jika ID valid
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => RouteBloc(apiService: ApiService()),
                    child: RouteScreen(
                      jalurId: route.id,
                      idGunung: widget.idGunung,
                    ),
                  ),
                ),
              );

// Log nilai idGunung dan jalurId
              print(
                  "Navigating to RouteScreen with idGunung: ${widget.idGunung}, jalurId: ${route.id}");
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 8.h),
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 16.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12.h),
                    child: CustomImageView(
                      imagePath:
                          ImageConstant.imgLinkedin, // Gunakan gambar default
                      height: 20.h,
                      width: 18.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      route.nama, // Nama jalur
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildElevationColumn(
      BuildContext context, DetailMountainModel detailMountain) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          Row(
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
                    "${detailMountain.height} m",
                    style: CustomTextStyles.titleMediumSemiBold,
                  ),
                ],
              ),
              CustomElevatedButton(
                height: 42.h,
                width: 188.h,
                text: detailMountain.province,
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
        ],
      ),
    );
  }

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

  onTapIconarrowone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.berandaScreen,
    );
  }
}
