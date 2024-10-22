import 'package:flutter/material.dart';
import 'package:myhiking/presentation/beranda_screen/beranda_initial_page.dart';
import 'package:myhiking/presentation/profile_screen/profile_screen.dart';
import 'package:myhiking/presentation/riwayat_page/riwayat_page.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/data_profile_bloc.dart';
import 'models/data_profile_model.dart';
import 'package:myhiking/widgets/custom_elevated_button.dart';
import '../../theme/custom_button_style.dart';

// ignore_for_file: must_be_immutable
class DataProfileScreen extends StatelessWidget {
  DataProfileScreen({super.key});

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<DataProfileBloc>(
      create: (context) => DataProfileBloc(DataProfileState(
        dataProfileModelObj: const DataProfileModel(),
      ))
        ..add(DataProfileInitialEvent()),
      child: DataProfileScreen(),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildProfileHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 26.h, right: 14.h, top: 10.h),
                      child: Column(
                        children: [
                          SizedBox(
                            // height: 35.h,
                            width: 334.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_nama_lengkap".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyMediumGray50004
                                      .copyWith(
                                    height: 1.40,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                _buildFullNameInput(context),
                                SizedBox(height: 10.h),
                                Text(
                                  "lbl_nik".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyMediumGray50003
                                      .copyWith(
                                    height: 1.40,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                _buildNikInput(context),
                                SizedBox(height: 12.h),
                                Text(
                                  "lbl_no_telepon".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyMediumGray50003
                                      .copyWith(
                                    height: 1.40,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                _buildPhoneNumberInput(context),
                                SizedBox(height: 12.h),
                                Text(
                                  "msg_no_telepon_darurat".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyMediumGray50003
                                      .copyWith(
                                    height: 1.40,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                _buildEmergencyContactInput(context),
                                SizedBox(height: 10.h),
                                Text(
                                  "lbl_alamat".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyMediumGray50003
                                      .copyWith(
                                    height: 1.40,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                _buildAddressInput(context),
                                SizedBox(height: 10.h),
                                Text(
                                  "lbl_email2".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyMediumGray50003
                                      .copyWith(
                                    height: 1.40,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                _buildEmailInput(context),
                                SizedBox(height: 4.h),
                                _buildIdentityUploadSection(context),
                                // SizedBox(height: 4.h),
                                CustomElevatedButton(
                                  margin: EdgeInsets.symmetric(vertical: 0.0),
                                  buttonStyle:
                                      CustomButtonStyles.fillPrimaryTL12,
                                  buttonTextStyle: CustomTextStyles
                                      .labelLargePrimarySemiBoldw,
                                  text: "Simpan".tr,
                                  alignment: Alignment.centerRight,
                                  onPressed: () {},
                                ),
                                SizedBox(height: 20.h),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Ubah Password",
                                    style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 4, 57, 101),
                                      fontSize: 15.fSize,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 45.h),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          child: _buildBottomNavigation(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      height: 164.h,
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 10.h),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 202.h,
            margin: EdgeInsets.only(bottom: 30.h),
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 28.h,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.7),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "lbl_data_profile".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUserProfileDetails,
            height: 164.h,
            width: 170.h,
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFullNameInput(BuildContext context) {
    return BlocSelector<DataProfileBloc, DataProfileState,
        TextEditingController?>(
      selector: (state) => state.fullNameInputController,
      builder: (context, fullNameInputController) {
        return CustomTextFormField(
          controller: fullNameInputController,
          contentPadding: EdgeInsets.all(12.h),
          borderDecoration: TextFormFieldStyleHelper.outlineGrayTL5,
          filled: false,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildNikInput(BuildContext context) {
    return BlocSelector<DataProfileBloc, DataProfileState,
        TextEditingController?>(
      selector: (state) => state.nikInputController,
      builder: (context, nikInputController) {
        return CustomTextFormField(
          controller: nikInputController,
          contentPadding: EdgeInsets.all(12.h),
          borderDecoration: TextFormFieldStyleHelper.outlineGrayTL5,
          filled: false,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberInput(BuildContext context) {
    return BlocSelector<DataProfileBloc, DataProfileState,
        TextEditingController?>(
      selector: (state) => state.phoneNumberInputController,
      builder: (context, phoneNumberInputController) {
        return CustomTextFormField(
          controller: phoneNumberInputController,
          contentPadding: EdgeInsets.all(12.h),
          borderDecoration: TextFormFieldStyleHelper.outlineGrayTL5,
          filled: false,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildEmergencyContactInput(BuildContext context) {
    return BlocSelector<DataProfileBloc, DataProfileState,
        TextEditingController?>(
      selector: (state) => state.emergencyContactInputController,
      builder: (context, emergencyContactInputController) {
        return CustomTextFormField(
          controller: emergencyContactInputController,
          contentPadding: EdgeInsets.all(12.h),
          borderDecoration: TextFormFieldStyleHelper.outlineGrayTL5,
          filled: false,
        );
      },
    );
  }

  Widget _buildAddressInput(BuildContext context) {
    return BlocSelector<DataProfileBloc, DataProfileState,
        TextEditingController?>(
      selector: (state) => state.addressInputController,
      builder: (context, addressInputController) {
        return CustomTextFormField(
          controller: addressInputController,
          contentPadding: EdgeInsets.all(12.h),
          borderDecoration: TextFormFieldStyleHelper.outlineGrayTL5,
          filled: false,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildEmailInput(BuildContext context) {
    return BlocSelector<DataProfileBloc, DataProfileState,
        TextEditingController?>(
      selector: (state) => state.emailInputController,
      builder: (context, emailInputController) {
        return CustomTextFormField(
          controller: emailInputController,
          textInputAction: TextInputAction.done,
          contentPadding: EdgeInsets.all(12.h),
          borderDecoration: TextFormFieldStyleHelper.outlineGrayTL5,
          filled: false,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildIdentityUploadSection(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Text(
                  "msg_unggah_kartu_identitas".tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumGray50003.copyWith(
                    height: 1.40,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.all(6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.roundedBorder6,
                    border: Border.all(
                      color: appTheme.gray400,
                      width: 1.h,
                    ),
                  ),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text(
                          "msg_upload_file_jpeg".tr,
                          style: CustomTextStyles.bodySmallGray50003Light,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.h),
                        decoration: BoxDecoration(
                          color: appTheme.blueGray10001,
                          borderRadius: BorderRadiusStyle.roundedBorder6,
                          border: Border.all(
                            color: appTheme.gray400,
                            width: 1.h,
                          ),
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "lbl_pilih_file".tr,
                                style: CustomTextStyles.bodySmallBlack900Light,
                              )
                            ]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
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

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Favorite:
        return AppRoutes.berandaInitialPage;
      case BottomBarEnum.Iconmap:
        return AppRoutes.riwayatPage;
      case BottomBarEnum.Iconprofile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }
}
