import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/pop_up_checkout_bloc.dart';
import 'models/pop_up_checkout_model.dart'; // ignore_for_file: must_be_immutable

class PopUpCheckoutDialog extends StatelessWidget {
  const PopUpCheckoutDialog({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<PopUpCheckoutBloc>(
      create: (context) => PopUpCheckoutBloc(
        PopUpCheckoutState(
          popUpCheckoutModelobj: const PopUpCheckoutModel(),
        ),
      )..add(PopUpCheckoutInitialEvent()),
      child: const PopUpCheckoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 26.h,
            vertical: 40.h,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 72.h,
                width: double.maxFinite,
                margin: EdgeInsets.only(
                  left: 34.h,
                  right: 26.h,
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Text(
                      "msg_konfirmasi_pendakian".tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.titleSmallBlack900Medium.copyWith(
                        height: 1.40,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "lbl_checkout".tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.headlineLargeRed700.copyWith(
                          height: 1.40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              buildBarcodeButtonsRow(context),
              SizedBox(height: 6.h)
            ],
          ),
        )
      ],
    );
  }

  Widget buildBarcodeButtonsRow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 4.h),
      child: Row(
        children: [
          Expanded(
            child: CustomElevatedButton(
              height: 36.h,
              text: "lbl_barcode".tr,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
              onPressed: () {
                onTapBarcode(context);
              },
            ),
          ),
          SizedBox(width: 18.h),
          Expanded(
            child: CustomElevatedButton(
              height: 36.h,
              text: "lbl_gform".tr,
              buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  onTapBarcode(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.tiketScreen,
    );
  }
}
