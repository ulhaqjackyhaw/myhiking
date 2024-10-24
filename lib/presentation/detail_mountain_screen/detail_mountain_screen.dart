import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/detail_mountain_bloc.dart';
import 'models/detail_mountain_model.dart';

class DetailMountainScreen extends StatelessWidget {
  const DetailMountainScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<DetailMountainBloc>(
      create: (context) => DetailMountainBloc(
        DetailMountainState(
            detailMountainModelObj: const DetailMountainModel()),
      )..add(DetailMountainInitialEvent()),
      child: const DetailMountainScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMountainBloc, DetailMountainState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray50,
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(
                    height: 394.h,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        _buildBackgroundStack(context),
                        Text(
                          "lbl_gunung_slamet".tr,
                          style: CustomTextStyles.headlineSmall_1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildElevationColumn(context),
                  Expanded(
                      child: SingleChildScrollView(
                    child: _buildRouteList(context),
                  ))
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
      child: Column(
        children: [
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRouteTwo(
              context,
              jalurGuciOne: "msg_jalur_bambangan".tr,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRouteTwo(
              context,
              jalurGuciOne: "lbl_jalur_guci".tr,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRouteTwo(
              context,
              jalurGuciOne: "lbl_jalur_dipajaya2".tr,
              onTapRouteTwo: () {
                onTapRouteThree(context);
              },
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRouteTwo(
              context,
              jalurGuciOne: "Jalur Baturaden".tr,
              onTapRouteTwo: () {
                onTapRouteThree(context);
              },
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRouteTwo(
              context,
              jalurGuciOne: "Jalur Kaliwadas".tr,
              onTapRouteTwo: () {
                onTapRouteThree(context);
              },
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRouteTwo(
              context,
              jalurGuciOne: "Jalur Gunung Malang".tr,
              onTapRouteTwo: () {
                onTapRouteThree(context);
              },
            ),
          ),
          SizedBox(height: 10.h),
        ],
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
                          appTheme.gray50.withOpacity(0)
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
  Widget _buildElevationColumn(BuildContext context) {
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
                      "lbl_3_432_m".tr,
                      style: CustomTextStyles.titleMediumSemiBold,
                    ),
                  ],
                ),
                CustomElevatedButton(
                  height: 42.h,
                  width: 188.h,
                  text: "lbl_jawa_tengah".tr,
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

  /// Common widget
  Widget _buildRouteTwo(
    BuildContext context, {
    required String jalurGuciOne,
    Function? onTapRouteTwo,
  }) {
    return GestureDetector(
      onTap: () {
        onTapRouteTwo?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 16.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadiusStyle.roundedBorder6,
          border: Border.all(
            color: theme.colorScheme.primary,
            width: 1.h,
          ),
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
            Text(
              jalurGuciOne,
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
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

  // Navigates to the routeScreen when the action is triggered.
  onTapRouteThree(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.routeScreen,
    );
  }
}
