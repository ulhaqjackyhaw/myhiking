// import 'package:flutter/material.dart';
// import '../../core/app_export.dart';
// import '../../widgets/custom_search_view.dart';
// import '../pop_up_lengkapi_data_diri_dialog/pop_up_lengkapi_data_diri_dialog.dart';
// import 'bloc/beranda_bloc.dart';
// import 'models/beranda_initial_model.dart';
// import 'models/homelist_item_model.dart';
// import 'widgets/homelist_item_widget.dart';

// class BerandaInitialPage extends StatefulWidget {
//   const BerandaInitialPage({super.key});

//   @override
//   BerandaInitialPageState createState() => BerandaInitialPageState();

//   static Widget builder(BuildContext context) {
//     return BlocProvider<BerandaBloc>(
//       create: (context) => BerandaBloc(
//         BerandaState(
//           berandaInitialModelObj: BerandaInitialModel(),
//         ),
//       )..add(BerandaInitialEvent()),
//       child: const BerandaInitialPage(),
//     );
//   }
// }

// class BerandaInitialPageState extends State<BerandaInitialPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // child: Container(
//       width: double.maxFinite,
//       padding: EdgeInsets.symmetric(horizontal: 16.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 20.h),
//           Padding(
//             padding: EdgeInsets.only(left: 14.h),
//             child: Text(
//               "User".tr,
//               style: CustomTextStyles.titleMediumGray80001,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               onTapTxtIdCounter(context);
//             },
//             child: Padding(
//               padding: EdgeInsets.only(left: 14.h),
//               child: Text(
//                 "lbl_id_123456".tr,
//                 style: CustomTextStyles.bodySmallGray800,
//               ),
//             ),
//           ),
//           SizedBox(height: 4.h),
//           Padding(
//             padding: EdgeInsets.only(left: 8.h, right: 16.h),
//             child:
//                 BlocSelector<BerandaBloc, BerandaState, TextEditingController?>(
//               selector: (state) => state.searchController,
//               builder: (context, searchController) {
//                 return CustomSearchView(
//                   controller: searchController,
//                   hintText: "lbl_cari".tr,
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 10.h,
//                     vertical: 12.h,
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 6.h),
//           Expanded(
//               child: SingleChildScrollView(
//             child: _buildHomeList(context),
//           ))
//         ],
//       ),
//     );
//     // );
//   }

//   /// Section Widget
//   Widget _buildHomeList(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(right: 4.h),
//       child: BlocSelector<BerandaBloc, BerandaState, BerandaInitialModel?>(
//         selector: (state) => state.berandaInitialModelObj,
//         builder: (context, berandaInitialModelObj) {
//           return ListView.separated(
//             padding: EdgeInsets.zero,
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             separatorBuilder: (context, index) {
//               return SizedBox(
//                 height: 10.h,
//               );
//             },
//             itemCount: berandaInitialModelObj?.homelistItemList.length ?? 0,
//             itemBuilder: (context, index) {
//               HomelistItemModel model =
//                   berandaInitialModelObj?.homelistItemList[index] ??
//                       HomelistItemModel();
//               return HomelistItemWidget(model);
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// Displays a dialog with the [PopUpLengkapiDataDiriDialog] content.
//   onTapTxtIdCounter(BuildContext context) {
//     showDialog(
//       context: NavigatorService.navigatorKey.currentContext!,
//       builder: (_) => AlertDialog(
//         content: Padding(
//           padding: const EdgeInsets.all(
//               16.0),
//           child: PopUpLengkapiDataDiriDialog.builder(
//             NavigatorService.navigatorKey.currentContext!,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         contentPadding: EdgeInsets.zero,
//         insetPadding: const EdgeInsets.symmetric(
//             horizontal: 20.0, vertical: 24.0), // Margin dari tepi layar
//       ),
//     );
//   }
// }
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import '../../core/app_export.dart';
  import '../../widgets/custom_search_view.dart';
  import '../pop_up_lengkapi_data_diri_dialog/pop_up_lengkapi_data_diri_dialog.dart';
  import 'bloc/beranda_bloc.dart';
  import 'models/beranda_initial_model.dart';
  import 'models/homelist_item_model.dart';
  import 'widgets/homelist_item_widget.dart';

  class BerandaInitialPage extends StatefulWidget {
    const BerandaInitialPage({super.key});

    @override
    BerandaInitialPageState createState() => BerandaInitialPageState();

    static Widget builder(BuildContext context) {
      return BlocProvider<BerandaBloc>(
        create: (context) => BerandaBloc(
          BerandaState(
            berandaInitialModelObj: BerandaInitialModel(),
          ),
        )..add(BerandaInitialEvent()),
        child: const BerandaInitialPage(),
      );
    }
  }

  class BerandaInitialPageState extends State<BerandaInitialPage> {
    @override
    Widget build(BuildContext context) {
      return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 14.h),
              child: Text(
                "User".tr,
                style: CustomTextStyles.titleMediumGray80001,
              ),
            ),
            GestureDetector(
              onTap: () {
                onTapTxtIdCounter(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 14.h),
                child: Text(
                  "lbl_id_123456".tr,
                  style: CustomTextStyles.bodySmallGray800,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.only(left: 8.h, right: 16.h),
              child:
                  BlocSelector<BerandaBloc, BerandaState, TextEditingController?>(
                selector: (state) => state.searchController,
                builder: (context, searchController) {
                  return CustomSearchView(
                    controller: searchController,
                    hintText: "lbl_cari".tr,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 12.h,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 6.h),
            Expanded(
              child: SingleChildScrollView(
                child: _buildHomeList(context),
              ),
            ),
          ],
        ),
      );
    }

    /// Section Widget
    Widget _buildHomeList(BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(right: 4.h),
        child: BlocSelector<BerandaBloc, BerandaState, BerandaInitialModel?>(
          selector: (state) => state.berandaInitialModelObj,
          builder: (context, berandaInitialModelObj) {
            return ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemCount: berandaInitialModelObj?.homelistItemList.length ?? 0,
              itemBuilder: (context, index) {
                HomelistItemModel model =
                    berandaInitialModelObj?.homelistItemList[index] ??
                        HomelistItemModel();
                return HomelistItemWidget(
                    model); // Memanggil widget dengan model gunung
              },
            );
          },
        ),
      );
    }

    /// Displays a dialog with the [PopUpLengkapiDataDiriDialog] content.
    onTapTxtIdCounter(BuildContext context) {
      showDialog(
        context: NavigatorService.navigatorKey.currentContext!,
        builder: (_) => AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: PopUpLengkapiDataDiriDialog.builder(
              NavigatorService.navigatorKey.currentContext!,
            ),
          ),
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 24.0), // Margin dari tepi layar
        ),
      );
    }
  }
