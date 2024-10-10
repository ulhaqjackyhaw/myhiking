import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../pop_up_checkout_dialog/pop_up_checkout_dialog.dart';
import 'bloc/riwayat_bloc.dart';
import 'models/recentclimbinglist_item_model.dart';
import 'models/riwayat_model.dart';
import 'widgets/recentclimbinglist_item_widget.dart';

// ignore_for_file: must_be_immutable
class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<RiwayatBloc>(
      create: (context) => RiwayatBloc(RiwayatState(
        riwayatModelObj: RiwayatModel(),
      ))..add(RiwayatInitialEvent()),
      child: const RiwayatPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        body: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.gray50,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildHikingEquipmentSection(context),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_riwayat".tr,
                            style: CustomTextStyles.titleMediumBlack900,
                          ),
                          SizedBox(height: 10.h),
                          _buildRecentClimbingList(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHikingEquipmentSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 10.h),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.img37081,
            height: 136.h,
            width: 186.h,
          ),
          SizedBox(width: 8.h),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(bottom: 28.h),
                padding: EdgeInsets.only(
                  left: 30.h,
                  top: 8.h,
                  bottom: 8.h,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 4.h),
                    Text(
                      "lbl_hello".tr,
                      style: CustomTextStyles.titleMediumOnPrimary_2,
                    ),
                    Text(
                      "lbl_prastita_s".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRecentClimbingList(BuildContext context) {
    return Expanded(
      child: BlocSelector<RiwayatBloc, RiwayatState, RiwayatModel?>(
        selector: (state) => state.riwayatModelObj,
        builder: (context, riwayatModelObj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.h);
            },
            itemCount: riwayatModelObj?.recentclimbinglistItemList.length ?? 0,
            itemBuilder: (context, index) {
              RecentclimbinglistItemModel model =
                  riwayatModelObj?.recentclimbinglistItemList[index] ??
                      RecentclimbinglistItemModel();
              return RecentclimbinglistItemWidget(
                model,
                onTapRecentclimbing: () {
                  onTapRecentclimbing(context);
                },
              );
            },
          );
        },
      ),
    );
  }

  /// Displays a dialog with the [PopUpCheckoutDialog] content.
  void onTapRecentclimbing(BuildContext context) {
    showDialog(
      context: NavigatorService.navigatorKey.currentContext!,
      builder: (_) => AlertDialog(
        content: PopUpCheckoutDialog.builder(
          NavigatorService.navigatorKey.currentContext!,
        ),
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
      ),
    );
  }
}
