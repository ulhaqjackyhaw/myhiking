import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/tata_tertib_bloc.dart';
import 'models/tata_tertib_model.dart';

class TataTertibScreen extends StatelessWidget {
  const TataTertibScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<TataTertibBloc>(
      create: (context) => TataTertibBloc(TataTertibState(
        tataTertibModelObj: const TataTertibModel(),
      ))
        ..add(TataTertibInitialEvent()),
      child: const TataTertibScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TataTertibBloc, TataTertibState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 32.h,
                top: 16.h,
                right: 32.h,
              ),
              child: Column(
                children: [
                  Text(
                    "lbl_tata_tertib".tr,
                    style: CustomTextStyles.titleSmallBlack90015,
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    "msg_pelayanan_dan_pelaksanaan".tr,
                    maxLines: 30,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: CustomTextStyles.bodySmallBlack90011.copyWith(
                      height: 1.40,
                    ),
                  ),
                  SizedBox(height: 18.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
