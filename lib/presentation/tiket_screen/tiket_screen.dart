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

class TiketScreen extends StatefulWidget {
  final int pesananId;

  const TiketScreen({super.key, required this.pesananId});

  static Widget builder(BuildContext context, int pesananId) {
    return BlocProvider<TiketBloc>(
      create: (context) => TiketBloc()..add(TiketLoadDataEvent(pesananId: pesananId)),
      child: TiketScreen(pesananId: pesananId),
    );
  }

  @override
  _TiketScreenState createState() => _TiketScreenState();
}

class _TiketScreenState extends State<TiketScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TiketBloc, TiketState>(
      builder: (context, state) {
        if (state is TiketLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TiketErrorState) {
          return Center(child: Text(state.message));
        } else if (state is TiketLoadedState) {
          final tiket = state.tiketModel;
          print(tiket.id);
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
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 102.h,
                                          padding: EdgeInsets.symmetric(vertical: 4.h),
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.onPrimary,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: double.maxFinite,
                                                margin: EdgeInsets.only(right: 8.h),
                                                child: QrImageView(
                                                  data: '${widget.pesananId}', //diganti ke id pesanan
                                                  size: 86.h, // Perbesar ukuran QR Code
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
                                        "ID Pemesanan",
                                        style: theme.textTheme.bodySmall,
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(tiket.id.toString()), // masukan data json id pemesanan
                                      SizedBox(height: 14.h),
                                      Text(
                                        "lbl_nama_ketua".tr,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                      SizedBox(height: 4.h),
                                      Text('${tiket.pemesanName}'),
                                      SizedBox(height: 14.h),
                                      Text(
                                        "lbl_booking2".tr,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                      SizedBox(height: 4.h),
                                      Text('${tiket.gunungName} via ${tiket.jalurName}'),
                                      SizedBox(height: 12.h),
                                      Text(
                                        "lbl_tanggal".tr,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                      SizedBox(height: 4.h),
                                      Text('${tiket.tanggalNaik}'),
                                      SizedBox(height: 12.h),
                                      Text(
                                        "lbl_anggota".tr,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                      SizedBox(height: 2.h),
                                      for (var anggota in tiket.anggota)
                                        Text(
                                          '- ${anggota.name}'.tr, // memasukan id anggota dan namanya
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
                                        text: "Download Tiket".tr,
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
        } else {
          // Default fallback return
          return const SizedBox(); // Return an empty widget as a fallback
        }
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
