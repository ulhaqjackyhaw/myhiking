import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/transaksi_bloc.dart';
import 'models/transactionlist_item_model.dart';
import 'models/transaksi_model.dart';
import 'widgets/transactionlist_item_widget.dart';

// ignore_for_file: must_be_immutable
class TransaksiPage extends StatelessWidget {
  const TransaksiPage({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<TransaksiBloc>(
      create: (context) => TransaksiBloc(TransaksiState(
        transaksiModelObj: TransaksiModel(),
      ))
        ..add(TransaksiInitialEvent()),
      child: const TransaksiPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
          title: Container(), // Set title to an empty Container to remove it
        ),
        backgroundColor: appTheme.gray50,
        body: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.gray50,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildWomanReceiveSection(context),
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
                            "lbl_transaksi".tr, // This instance remains
                            style: CustomTextStyles.titleMediumBlack900,
                          ),
                          SizedBox(height: 10.h),
                          _buildTransactionList(context),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWomanReceiveSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 22.h),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgWomanReceivedDividend,
            height: 174.h,
            width: 174.h,
          ),
          SizedBox(width: 4.h),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 32.h,
                top: 14.h,
                bottom: 14.h,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTransactionList(BuildContext context) {
    return Expanded(
      child: BlocSelector<TransaksiBloc, TransaksiState, TransaksiModel?>(
        selector: (state) => state.transaksiModelObj,
        builder: (context, transaksiModelObj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 18.h,
              );
            },
            itemCount: transaksiModelObj?.transactionlistItemList.length ?? 0,
            itemBuilder: (context, index) {
              TransactionlistItemModel model =
                  transaksiModelObj?.transactionlistItemList[index] ??
                      TransactionlistItemModel();
              return TransactionlistItemWidget(
                model,
                onTapRecentclimbing: () {
                  _handleTapRecentClimbing(context, model.status,
                      model.id); // Pass model.id sebagai parameter
                },
                onChangeStatus: () {
                  if (model.id != null) {
                    context.read<TransaksiBloc>().add(ChangeStatusEvent(model
                        .id!)); // Gunakan '!' untuk mengekstrak nilai non-null
                  }
                },
              );
            },
          );
        },
      ),
    );
  }

  /// Navigates to the tiketScreen when the action is triggered.
  void _handleTapRecentClimbing(
      BuildContext context, String? status, String? id) {
    if (status == "Selesai") {
      NavigatorService.pushNamed(AppRoutes.tiketScreen);
    } else if (status == "Proses") {
      // Mengubah status
      if (id != null) {
        context
            .read<TransaksiBloc>()
            .add(ChangeStatusEvent(id)); // Mengubah status
      }
    }
  }
}
