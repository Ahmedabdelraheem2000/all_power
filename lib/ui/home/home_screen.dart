import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/home_controller.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/constants.dart';

class HomeScreen extends StatelessWidget {

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    AppHelper.statusBarColor(isHome: true);
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
          body: controller.listScreens[controller.navIndex],
          bottomNavigationBar: Card(
            elevation: 16,
            margin: const EdgeInsets.only(right: 8, left: 8, bottom: 20),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 20,
              selectedItemColor: HexColor(AppColors.appMainColor),
              unselectedItemColor: HexColor(AppColors.appSubColor),
              selectedLabelStyle: const TextStyle(fontFamily: Const.appFont, fontWeight: FontWeight.w500),
              unselectedLabelStyle: const TextStyle(fontFamily: Const.appFont, fontWeight: FontWeight.w500),
              currentIndex: controller.navIndex,
              items: _bottomNavigationBarItems(),
              onTap: (navIndex) => controller.getCurrenNavIndex(navIndex: navIndex),
            ),
          ),
        ));
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() => [
    BottomNavigationBarItem(activeIcon: SvgPicture.asset('${Const.icons}icon_jobs.svg', color: HexColor(AppColors.appMainColor),),
        icon: SvgPicture.asset('${Const.icons}icon_jobs.svg'), label: 'home'.tr),
    BottomNavigationBarItem(activeIcon: SvgPicture.asset('${Const.icons}icon_table.svg', color: HexColor(AppColors.appMainColor),),
        icon: SvgPicture.asset('${Const.icons}icon_table.svg'), label: 'your_table'.tr),
    BottomNavigationBarItem(activeIcon: SvgPicture.asset('${Const.icons}icon_notifications.svg', color: HexColor(AppColors.appMainColor),),
        icon: SvgPicture.asset('${Const.icons}icon_notifications.svg'), label: 'notifications'.tr),
    BottomNavigationBarItem(activeIcon: SvgPicture.asset('${Const.icons}icon_settings.svg', color: HexColor(AppColors.appMainColor),),
        icon: SvgPicture.asset('${Const.icons}icon_settings.svg'), label: 'settings'.tr),
  ];
}
