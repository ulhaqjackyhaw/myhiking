import 'package:flutter/material.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/pilihan_bank_pembayaran_bloc.dart';
import 'models/paymentmethodslist_item_model.dart';
import 'models/pilihan_bank_pembayaran_model.dart';
import 'widgets/paymentmethodslist_item_widget.dart';

class PilihanBankPembayaranScreen extends StatelessWidget {
  const PilihanBankPembayaranScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<PilihanBankPembayaranBloc>(
      create: (context) => PilihanBankPembayaranBloc(
        PilihanBankPembayaranState(
          pilihanBankPembayaranModelObj: PilihanBankPembayaranModel(),
        ),
      )..add(PilihanBankPembayaranInitialEvent()),
      child: const PilihanBankPembayaranScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 6.h,
            top: 2.h,
            right: 6.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildPaymentSelectionStepper(context),
              SizedBox(height: 16.h),
              _buildPaymentMethodsList(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildPaymentButtonSection(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 31.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(left: 13.h),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "lbl_booking".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentSelectionStepper(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 12.h,
        right: 8.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 4.h),
            child: AnotherStepper(
              iconHeight: 24,
              iconWidth: 26,
              stepperDirection: Axis.horizontal,
              activeIndex: 0,
              barThickness: 4,
              inverted: true,
              stepperList: [
                StepperData(
                  iconWidget: Container(
                    height: 24.h,
                    width: 26.h,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "lbl_1".tr,
                          style: CustomTextStyles.titleMediumOnPrimary_2,
                        ),
                      ],
                    ),
                  ),
                ),
                StepperData(
                  iconWidget: Container(
                    height: 24.h,
                    width: 26.h,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "lbl_2".tr,
                          style: CustomTextStyles.titleMediumOnPrimary_2,
                        ),
                      ],
                    ),
                  ),
                ),
                StepperData(
                  iconWidget: Container(
                    height: 22.h,
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
          SizedBox(height: 38.h),
          Text(
            "msg_pilih_pembayaran".tr,
            style: CustomTextStyles.titleMediumGray900_1,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentMethodsList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 2.h),
        child: BlocSelector<PilihanBankPembayaranBloc,
            PilihanBankPembayaranState, PilihanBankPembayaranModel?>(
          selector: (state) => state.pilihanBankPembayaranModelObj,
          builder: (context, pilihanBankPembayaranModelObj) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 14.h);
              },
              itemCount: pilihanBankPembayaranModelObj?.paymentmethodslistItemList.length ?? 0,
              itemBuilder: (context, index) {
                PaymentmethodslistItemModel model =
                    pilihanBankPembayaranModelObj?.paymentmethodslistItemList[index] ?? 
                    PaymentmethodslistItemModel();
                return PaymentmethodslistItemWidget(
                  model,
                  onTapRadioGroup: (value) {
                    context.read<PilihanBankPembayaranBloc>().add(
                      PaymentmethodslistItemEvent(
                        index: index,
                        radioGroup: value,
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentButtonSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            height: 48.h,
            text: "lbl_bayar_sekarang".tr.toUpperCase(),
            margin: EdgeInsets.only(bottom: 12.h),
            buttonStyle: CustomButtonStyles.fillBlueGray,
            buttonTextStyle: theme.textTheme.labelLarge!,
          ),
        ],
      ),
    );
  }
}
