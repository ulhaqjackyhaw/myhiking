import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_radio_button.dart';
import '../models/paymentmethodslist_item_model.dart';
import '../bloc/pilihan_bank_pembayaran_bloc.dart';

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
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 14.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder20,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 0.75.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.blueGray40019,
            spreadRadius: 2.h,
            blurRadius: 1.h,
            offset: const Offset(
              4,
              4,
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: paymentmethodslistItemModelObj.gopayOne!,
            height: 45.h,
            width: 45.h,
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
            value: ""??"",
            groupValue: paymentmethodslistItemModelObj.radioGroup!,
            onChange: (value) {
              onTapRadioGroup??(value);
            },
          )
        ],
      ),
    );
  }
}
