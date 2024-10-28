import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../models/recentclimbinglist_item_model.dart';
import '../../pop_up_checkout_dialog/pop_up_checkout_dialog.dart';

// ignore_for_file: must_be_immutable
class RecentclimbinglistItemWidget extends StatelessWidget {
  RecentclimbinglistItemWidget(
    this.recentclimbinglistItemModelObj, {
    super.key,
    this.onTapRecentclimbing,
  });

  RecentclimbinglistItemModel recentclimbinglistItemModelObj;
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
                4,
                4,
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
                        recentclimbinglistItemModelObj.rabu27agustus!,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        recentclimbinglistItemModelObj.gunungslamet!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildMendakiButton(context),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMendakiButton(BuildContext context) {
    return CustomElevatedButton(
      height: 26.h,
      width: 98.h,
      text: "lbl_mendaki".tr,
      buttonStyle: CustomButtonStyles.outlineTeal,
      buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
      onPressed: () {
        // Menampilkan popup checkout
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: PopUpCheckoutDialog.builder(
              context,
            ),
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
          ),
        );
      },
    );
  }
}
