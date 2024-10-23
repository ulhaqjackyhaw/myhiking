import 'package:flutter/material.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import '../../core/app_export.dart';
import '../../core/utils/date_time_utils.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/booking_bloc.dart';
import 'models/booking_model.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<BookingBloc>(
      create: (context) => BookingBloc(BookingState(
        bookingModelObj: BookingModel(),
      ))
        ..add(BookingInitialEvent()),
      child: const BookingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray5001,
        appBar: _buildAppbar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: Column(
                children: [
                  SizedBox(height: 4.h),
                  _buildProgressSection(context),
                  SizedBox(height: 28.h),
                  _buildHotelCard(context),
                  SizedBox(height: 28.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 4.h,
                      right: 6.h,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.roundedBorder20,
                            border: Border.all(
                              color: theme.colorScheme.primaryContainer,
                              width: 2.h,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "FORM PESANAN".tr,
                                  style: CustomTextStyles.titleMediumManrope,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                width: double.maxFinite,
                                child: Divider(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              SizedBox(height: 24.h),
                              Padding(
                                padding: EdgeInsets.only(left: 24.h),
                                child: Text(
                                  "msg_tanggal_pemesanan".tr.toUpperCase(),
                                  style: CustomTextStyles.labelLargePrimary,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              _buildBookingDateField(context),
                              SizedBox(height: 14.h),
                              Padding(
                                padding: EdgeInsets.only(left: 24.h),
                                child: Text(
                                  "lbl_tambah_anggota".tr.toUpperCase(),
                                  style: CustomTextStyles.labelLargePrimary,
                                ),
                              ),
                              SizedBox(height: 14.h),
                              _buildMemberIdField(context),
                              // SizedBox(height: 8.h),
                              // _buildMemberNameField(context),
                              SizedBox(height: 124.h)
                            ],
                          ),
                        ),
                        SizedBox(height: 22.h),
                        _buildContinueButton(context)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      height: 40.h,
      title: Container(
        width: double.maxFinite,
        margin:
            EdgeInsets.symmetric(horizontal: 13.h), // Adjust margins as needed
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Space between items
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back
              },
              padding: EdgeInsets.only(right: 16.h), // Adjust padding as needed
            ),
            Expanded(
              child: Center(
                child: AppbarSubtitleOne(
                  text: "lbl_booking".tr,
                ),
              ),
            ),
            // Placeholder for spacing, adjust if needed
            SizedBox(width: 50.h), // You can adjust this width
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProgressSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 2.h,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: AnotherStepper(
              iconHeight: 26,
              iconWidth: 26,
              stepperDirection: Axis.horizontal,
              activeIndex: 0,
              barThickness: 4,
              inverted: true,
              stepperList: [
                StepperData(
                  iconWidget: Container(
                    height: 26.h,
                    width: 26.h,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "lbl_1".tr,
                          style: CustomTextStyles.titleSmallOnPrimaryMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                StepperData(
                  iconWidget: Container(
                    height: 26.h,
                    width: 26.h,
                    decoration: BoxDecoration(
                      // color: appTheme.gray5001,
                      borderRadius: BorderRadius.circular(12.h),
                      border: Border.all(
                        color: appTheme.blueGray100,
                        width: 2.h,
                      ),
                    ),
                  ),
                ),
                StepperData(
                  iconWidget: Container(
                    height: 26.h,
                    width: 26.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray5001,
                      borderRadius: BorderRadius.circular(12.h),
                      border: Border.all(
                        color: appTheme.blueGray100,
                        width: 2.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHotelCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder14,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.04),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              2,
            ),
          ),
        ],
      ),
      width: double.maxFinite,
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage1,
            height: 110.h,
            width: 146.h,
            radius: BorderRadius.circular(10.h),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text(
                      "lbl_jalur_dipajaya".tr,
                      style: CustomTextStyles.titleSmallGray900,
                    ),
                  ),
                  SizedBox(height: 58.h),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "lbl_rp_5_000_00".tr,
                          style: CustomTextStyles.titleSmallPrimary,
                        ),
                        Text(
                          "lbl_org".tr,
                          style: CustomTextStyles.titleSmallBluegray400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBookingDateField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.h),
      child: BlocSelector<BookingBloc, BookingState, TextEditingController?>(
        selector: (state) => state.bookingDateFieldController,
        builder: (context, bookingDateFieldController) {
          return CustomTextFormField(
            readOnly: true,
            width: 130.h,
            controller: bookingDateFieldController,
            hintText: "Pilih Tanggal".tr,
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 12.h,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlineBlueGrayTL14,
            onTap: () {
              onTapBookingDateInput(context);
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildMemberIdField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.h),
      child: BlocSelector<BookingBloc, BookingState, TextEditingController?>(
        selector: (state) => state.memberIdFieldController,
        builder: (context, memberIdFieldController) {
          return CustomTextFormField(
            width: 280.h,
            controller: memberIdFieldController,
            hintText: "Masukkan ID anggota".tr,
            textInputAction: TextInputAction.done,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 12.h,
            ),
          );
        },
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return CustomOutlinedButton(
      height: 42.h,
      text: "lbl_lanjut2".tr,
      margin: EdgeInsets.only(
        left: 8.h,
        right: 4.h,
      ),
      buttonStyle: CustomButtonStyles.outlineBlueGray,
      buttonTextStyle: CustomTextStyles.labelLarge13,
      onPressed: () {
        onTapContinueButton(context);
      },
    );
  }

  /// Navigates to the routeScreen when the action is triggered.
  onTapArrowdownone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.routeScreen,
    );
  }

  /// Displays a date picker dialog and updates the selected date in the
  /// current [bookingModelObj] object if the user selects a valid date.
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapBookingDateInput(BuildContext context) async {
    var initialState = BlocProvider.of<BookingBloc>(context).state;
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (dateTime != null) {
      context.read<BookingBloc>().add(ChangeDateEvent(date: dateTime));
      initialState.bookingDateFieldController?.text =
          dateTime.format(pattern: SHORT_DATE);
    }
  }

  /// Navigates to the pilihanBankPembayaranScreen when the action is triggered.
  onTapContinueButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.pilihanBankPembayaranScreen,
    );
  }
}
