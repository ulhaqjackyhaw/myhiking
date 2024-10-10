import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../models/transactionlist_item_model.dart';

// ignore_for_file: must_be_immutable
class TransactionlistItemWidget extends StatelessWidget {
  TransactionlistItemWidget(
    this.transactionlistItemModelObj, {
    super.key,
    this.onTapRecentclimbing,
  });

  TransactionlistItemModel transactionlistItemModelObj;
  VoidCallback? onTapRecentclimbing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapRecentclimbing?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.h,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadiusStyle.roundedBorder6,
          boxShadow: [
            BoxShadow(
              color: appTheme.blueGray40019,
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: const Offset(
                0,
                13,
              ),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactionlistItemModelObj.senintwentyseve!,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        transactionlistItemModelObj.gunungslamet!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildBerhasilButton(context),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBerhasilButton(BuildContext context) {
    return CustomElevatedButton(
      height: 26.h,
      width: 98.h,
      text: "lbl_berhasil".tr,
      buttonStyle: CustomButtonStyles.outlineTeal,
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
    );
  }
}
