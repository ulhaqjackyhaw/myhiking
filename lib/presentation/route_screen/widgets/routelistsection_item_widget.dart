import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/routelistsection_item_model.dart';

// ignore_for_file: must_be_immutable
class RoutelistsectionItemWidget extends StatelessWidget {
  RoutelistsectionItemWidget(this.routelistsectionItemModelObj, {super.key});

  RoutelistsectionItemModel routelistsectionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 98.h,
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadiusStyle.roundedBorder14,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.08),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: routelistsectionItemModelObj.tinggiOne!,
            height: 34.h,
            width: 36.h,
          ),
          SizedBox(height: 6.h),
          Text(
            routelistsectionItemModelObj.height!,
            style: CustomTextStyles.labelLargeInterGray500,
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                routelistsectionItemModelObj.zipcode!,
                style: CustomTextStyles.titleMediumInterGray80001,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  routelistsectionItemModelObj.meters!,
                  style: CustomTextStyles.labelLargeInterGray30001,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
