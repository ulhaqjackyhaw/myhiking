import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:qr_flutter/qr_flutter.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/tiket_bloc.dart';
import 'models/tiket_model.dart';

class TiketScreen extends StatelessWidget {
  const TiketScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<TiketBloc>(
      create: (context) => TiketBloc(TiketState( 
        tiketModelObj: const TiketModel(),
      ))
        ..add(TiketInitialEvent()),
      child: const TiketScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TiketBloc, TiketState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  color: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.roundedBorder30,
                  ),
                  child: Container(
                    height: 768.h,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary,
                      borderRadius: BorderRadiusStyle.roundedBorder30,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        _buildIconArrowColumn(context),
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.h,
                            vertical: 18.h,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadiusStyle.roundedBorder20,
                            boxShadow: [
                              BoxShadow(
                                color: appTheme.gray40019,
                                spreadRadius: 2.h,
                                blurRadius: 2.h,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 4.h),
                              Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 18.h,
                                  vertical: 20.h,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: fs.Svg(
                                      ImageConstant.imgETickets,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: 102.h,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4.h),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.onPrimary,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: double.maxFinite,
                                              margin:
                                                  EdgeInsets.only(right: 8.h),
                                              child: QrImageView(
                                                data: 'https://www.google.com',
                                                size: 86.h,
                                              ),
                                            ),
                                            SizedBox(height: 4.h),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 14.h),
                                    const SizedBox(
                                      width: double.maxFinite,
                                      child: Divider(),
                                    ),
                                    SizedBox(height: 12.h),
                                    Text(
                                      "lbl_id_pemesanan".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "lbl".tr,
                                      style:
                                          CustomTextStyles.titleLargeBlack900_1,
                                    ),
                                    SizedBox(height: 14.h),
                                    Text(
                                      "lbl_nama_ketua".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "lbl_prastista_sasa".tr,
                                      style:
                                          CustomTextStyles.titleLargeBlack900_1,
                                    ),
                                    SizedBox(height: 14.h),
                                    Text(
                                      "lbl_booking2".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "msg_gunung_slamet_via".tr,
                                      style:
                                          CustomTextStyles.titleSmallBlack900_1,
                                    ),
                                    SizedBox(height: 12.h),
                                    Text(
                                      "lbl_tanggal".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "msg_senin_27_agustus".tr,
                                      style:
                                          CustomTextStyles.titleSmallBlack900_1,
                                    ),
                                    SizedBox(height: 12.h),
                                    Text(
                                      "lbl_anggota".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      "msg_id793807_budi_a_id794287".tr,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles
                                          .titleSmallBlack900_1
                                          .copyWith(
                                        height: 1.71,
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Text(
                                      "msg_ticket_yang_sudah".tr,
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 6.h),
                                    const SizedBox(
                                      width: double.maxFinite,
                                      child: Divider(),
                                    ),
                                    SizedBox(height: 12.h),
                                    CustomElevatedButton(
                                      height: 50.h,
                                      text: "msg_download_ticket".tr,
                                      buttonStyle:
                                          CustomButtonStyles.outlineBlueGrayC,
                                      buttonTextStyle: CustomTextStyles
                                          .titleMediumManropeOnPrimary,
                                    ),
                                    SizedBox(height: 6.h),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildIconArrowColumn(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 40.h),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageConstant.imgGroup51,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBar(
              height: 30.h,
              leadingWidth: 52.h,
              leading: AppbarLeadingImage(
                imagePath: ImageConstant.imgIconArrowTeal900,
                margin: EdgeInsets.only(left: 24.h),
                onTap: () {
                  onTapIconarrowone(context);
                },
              ),
              actions: [
                AppbarTitle(
                  text: "msg_booking_berhasil".tr,
                  margin: EdgeInsets.only(right: 23.h),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the berandaScreen when the action is triggered.
  onTapIconarrowone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.berandaScreen,
    );
  }
}
