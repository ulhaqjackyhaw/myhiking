import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/routelistsection_item_model.dart';

// ignore_for_file: must_be_immutable
class RoutelistsectionItemWidget extends StatelessWidget {
  RoutelistsectionItemWidget(this.routelistsectionItemModelObj, {super.key});

  RoutelistsectionItemModel routelistsectionItemModelObj;

  Widget build(BuildContext context) {
    return Center(
    child: Container(
      width: 145.h,
      padding: EdgeInsets.symmetric(
        horizontal: 45.h,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder10,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.08),
            spreadRadius: 1.h,
            blurRadius: 2.h,
            offset: const Offset(2, 2),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: routelistsectionItemModelObj.tinggiOne!,
            height: 40.h,
            width: 40.h,
          ),
          SizedBox(height: 2.h),
          Text(
            routelistsectionItemModelObj.height!,
            style: CustomTextStyles.labelLargeInterGray500,
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                routelistsectionItemModelObj.zipcode!,
                style: CustomTextStyles.titleMediumInterGray80001,
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Text(
              //     routelistsectionItemModelObj.meters!,
              //     style: CustomTextStyles.labelLargeInterGray30001,
              //   ),
              // )
            ],
          )
        ],
      ),
    ));
  }
}
