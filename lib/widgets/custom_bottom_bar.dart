import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Favorite, Iconmap, Iconprofile }

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, this.onChanged});
  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

// ignore_for_file: must_be_immutable
class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgFavorite,
      activeIcon: ImageConstant.imgFavorite,
      type: BottomBarEnum.Favorite,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconMap,
      activeIcon: ImageConstant.imgIconMap,
      type: BottomBarEnum.Iconmap,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgLockBlueGray10002,
      activeIcon: ImageConstant.imgLockBlueGray10002,
      type: BottomBarEnum.Iconprofile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      decoration: BoxDecoration(
        color: const Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(10.h),
        boxShadow: [
          BoxShadow(
            color: const Color(0X3F000000),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(0, -1),
          )
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: index == 1
                  ? 33.h
                  : index == 2
                      ? 28.h
                      : 34.h,
              width: index == 1
                  ? 33.h
                  : index == 2
                      ? 28.h
                      : 34.h,
              color: const Color(0XFFCAD8EA),
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: index == 1
                  ? 33.h
                  : index == 2
                      ? 28.h
                      : 34.h,
              width: index == 1
                  ? 33.h
                  : index == 2
                      ? 28.h
                      : 34.h,
              color: const Color(0XFF127857),
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
class BottomMenuModel {
  BottomMenuModel(
      {required this.icon, required this.activeIcon, required this.type});
  String icon;
  String activeIcon;
  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
