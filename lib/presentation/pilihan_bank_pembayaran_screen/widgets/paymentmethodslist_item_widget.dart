import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_radio_button.dart';
import '../models/paymentmethodslist_item_model.dart';

// ignore_for_file: must_be_immutable
class PaymentmethodslistItemWidget extends StatelessWidget {
  const PaymentmethodslistItemWidget(
    this.paymentmethodslistItemModelObj, {
    super.key,
    this.onTapRadioGroup,
  });

  final PaymentmethodslistItemModel paymentmethodslistItemModelObj;
  final Function(String)? onTapRadioGroup;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder14,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.04),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: paymentmethodslistItemModelObj.gopayOne!,
            height: 50.h,
            width: 50.h,
            margin: EdgeInsets.only(left: 6.h),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                bottom: 6.h,
              ),
              child: Text(
                paymentmethodslistItemModelObj.debitcard!,
                style: CustomTextStyles.titleSmallGray900,
              ),
            ),
          ),
          const Spacer(),
          CustomRadioButton(
            value: "" ?? "",
            groupValue: paymentmethodslistItemModelObj.radioGroup!,
            onChange: (value) {
              onTapRadioGroup?.call(value);
            },
          )
        ],
      ),
    );
  }
}
