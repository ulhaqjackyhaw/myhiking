import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'bloc/route_bloc.dart';
import 'models/route_model.dart';
import 'models/routelistsection_item_model.dart';
import 'widgets/routelistsection_item_widget.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<RouteBloc>(
      create: (context) => RouteBloc(RouteState(
        routeModelObj: RouteModel(),
      ))
        ..add(RouteInitialEvent()),
      child: const RouteScreen(),
    );
  }

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
                          _buildContactInfoSection(context),
                          SizedBox(height: 4.h),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: CustomElevatedButton(
                                  height: 80.h,
                                  text: "Jarak\n5km",
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadiusStyle.roundedBorder14,
                                  boxShadow: [
                                    BoxShadow(
                                      color: appTheme.black900.withOpacity(0.08),
                                      spreadRadius: 1.h,
                                      blurRadius: 2.h,
                                      offset: const Offset(2, 2),
                                    )
                                  ],
                                ),
                                  buttonStyle: CustomButtonStyles.outlineBlack,
                                  buttonTextStyle: CustomTextStyles.bodySmallGray50003.copyWith(fontSize: 15),
                                  onPressed: () {
                                    // Aksi untuk tombol Jarak 5km
                                  },
                                  leftIcon: Icon(Icons.location_on, color: theme.colorScheme.primary),
                                ),
                              ),
                              SizedBox(width: 20.h), // Spasi antar tombol
                              Expanded(
                                child: CustomElevatedButton(
                                  height: 80.h,
                                  text: "Open\nMaps",
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadiusStyle.roundedBorder14,
                                  boxShadow: [
                                    BoxShadow(
                                      color: appTheme.black900.withOpacity(0.08),
                                      spreadRadius: 1.h,
                                      blurRadius: 2.h,
                                      offset: const Offset(2, 2),
                                    )
                                  ],
                                ),
                                
                                  buttonStyle: CustomButtonStyles.outlineBlack,
                                  buttonTextStyle: CustomTextStyles.bodySmallGray50003.copyWith(fontSize: 15),
                                  onPressed: () {
                                    // Aksi untuk tombol Open Maps
                                  },
                                  leftIcon: Icon(Icons.map, color: theme.colorScheme.primary),
                                  margin: EdgeInsets.only(right: 6.h),
                                ),
                              ),
                            ],
                          ),

                          _buildRouteListSection(context),
                          SizedBox(height: 23.h),
                          CustomElevatedButton(
                            height: 56.h,
                            text: "msg_tata_tertib_dan".tr,
                            margin: EdgeInsets.only(right: 6.h),
                            decoration: BoxDecoration(
                            color: theme.colorScheme.onPrimary,
                            borderRadius: BorderRadiusStyle.roundedBorder14,
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
                            margin: EdgeInsets.only(right: 6.h),
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

  /// Section Widget
  Widget _buildContactInfoSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLinkedin,
            height: 14.h,
            width: 12.h,
            margin: EdgeInsets.only(top: 6.h),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(
                "lbl_jalur_dipajaya".tr,
                style: CustomTextStyles.titleLargePrimaryBlack,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRouteListSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 26.h),
      width: double.maxFinite,
      child: BlocSelector<RouteBloc, RouteState, RouteModel?>(
        selector: (state) => state.routeModelObj,
        builder: (context, routeModelObj) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 13.h,
              children: List.generate(
                routeModelObj?.routelistsectionItemList.length ?? 0,
                (index) {
                  RoutelistsectionItemModel model =
                      routeModelObj?.routelistsectionItemList[index] ??
                          RoutelistsectionItemModel();
                  return RoutelistsectionItemWidget(model);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  /// Navigates to the detailMountainScreen when the action is triggered.
  onTapBtnIconarrowone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.detailMountainScreen);
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
