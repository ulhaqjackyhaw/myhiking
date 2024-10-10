import 'package:flutter/material.dart';
import 'package:myhiking/presentation/profile_screen/bloc/profile_bloc.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_icon_button.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(const ProfileState()),
      child: const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray50,
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildProfileHeader(context),
                  SizedBox(height: 44.h),
                  _buildProfileSettings(context),
                ],
              ),
            ),
            bottomNavigationBar: SizedBox(
              width: double.maxFinite,
              child: _buildBottomNavigation(context),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget: Profile Header
  Widget _buildProfileHeader(BuildContext context) {
    return SizedBox(
      height: 156.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 224.h,
            margin: EdgeInsets.only(bottom: 30.h),
            padding: EdgeInsets.only(left: 58.h, top: 14.h, bottom: 14.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.7),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "lbl_prastita_s".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "lbl_id_793928".tr,
                    style: CustomTextStyles.titleMediumOnPrimary_1,
                  ),
                ),
                SizedBox(height: 4.h)
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgAmping91,
            height: 156.h,
            width: 228.h,
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }

  /// Section Widget: Profile Settings
  Widget _buildProfileSettings(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => onTapProfileone(context),
            child: Container(
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimary,
                borderRadius: BorderRadiusStyle.roundedBorder14,
                border: Border.all(
                  color: theme.colorScheme.onPrimary,
                  width: 1.h,
                ),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.blueGray40019.withOpacity(0.08),
                    spreadRadius: 2.h,
                    blurRadius: 2.h,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: EdgeInsets.only(left: 4.h, bottom: 2.h),
                    color: appTheme.blueGray50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Container(
                      height: 24.h,
                      width: 24.h,
                      decoration: BoxDecoration(
                        color: appTheme.blueGray50,
                        borderRadius: BorderRadiusStyle.roundedBorder14,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgOutlineUsers,
                            height: 20.h,
                            width: double.maxFinite,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.h),
                    child: Text(
                      "lbl_data_profile".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  const Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    height: 24.h,
                    width: 24.h,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              borderRadius: BorderRadiusStyle.roundedBorder14,
              border:
                  Border.all(color: theme.colorScheme.onPrimary, width: 1.h),
              boxShadow: [
                BoxShadow(
                  color: appTheme.blueGray40019.withOpacity(0.08),
                  spreadRadius: 2.h,
                  blurRadius: 2.h,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: CustomIconButton(
                    height: 24.h,
                    width: 24.h,
                    padding: EdgeInsets.all(4.h),
                    decoration: IconButtonStyleHelper.fillBlueGray,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgClock,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14.h),
                  child: Text(
                    "lbl_cek_transaksi".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowRight,
                  height: 24.h,
                  width: 24.h,
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget: Bottom Navigation
  Widget _buildBottomNavigation(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(
              navigatorKey.currentContext!, getCurrentRoute(type));
        },
      ),
    );
  }

  /// Handling route based on bottom navigation actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Favorite:
        return AppRoutes.berandaInitialPage;
      case BottomBarEnum.Iconmap:
        return AppRoutes.riwayatPage;
      case BottomBarEnum.Lockbluegray10002:
        return AppRoutes.transaksiPage;
      default:
        return "/";
    }
  }

  /// Navigates to the dataProfileScreen when the action is triggered.
  void onTapProfileone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.dataProfileScreen);
  }
}
