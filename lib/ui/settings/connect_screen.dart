import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hire_me/controller/contact_us_controller.dart';
import 'package:hire_me/model/contact_us.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/components.dart';
import 'package:hire_me/utils/constants.dart';
import 'package:hire_me/utils/google_map_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectUsScreen  extends StatelessWidget {

  final _controller = Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor(AppColors.appMainColor),
        elevation: 0,
        title: AppText.medium(
            text: 'contact_us'.tr,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            textAlign: TextAlign.center),
        toolbarHeight: 60.h,
        centerTitle: true,
        actions: [
          InkWell(
            child: Container(
                margin: const EdgeInsets.only(left: 16, bottom: 4).r,
                child: SvgPicture.asset('${Const.icons}icon_map.svg')),
            onTap: () {
              GoogleMapUtils.openGoogleMap(
                  latitude: double.parse('31.784944'),
                  longitude: double.parse('35.227806'));
            },
          )
          // InkWell(
          //   child: Container(
          //       margin: const EdgeInsets.only(left: 16, bottom: 4).r,
          //       child: const CircleAvatar(
          //         backgroundImage: NetworkImage('${Const.defaultImage}'),
          //       )),
          //   onTap: () => Get.toNamed(Routes.profile),
          // )
        ],
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h,),
          Container(
            margin: const EdgeInsetsDirectional.only(top: 20, start: 40, end: 40),
            child: Center(
              child: Image.asset(
                '${Const.images}new_logo_profile.png',

              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 17,top: 17),
            child: Text('Type_job'.tr,style: TextStyle(
              color: const Color(0xff000000),
              fontWeight: FontWeight.w600,
              fontSize: 16.sp
            ),),
          ),
          SizedBox(height: 42.h,),
          Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),
                itemCount: _controller.listContactUs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 2,
                  childAspectRatio: 280 / 80,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => buildContactItem(_controller.listContactUs[index]),
          ))
        ],
      ),
    );
  }

  Widget buildContactItem(ContactUs contact) => Container(
    margin: const EdgeInsetsDirectional.only(start: 14,end: 14, top: 20),
    child: AppWidgets.CustomButton(
        text: '${contact.title}',
        textColor: AppColors.darkSecondColor,
        height: 12.h,
        radius: 22,
        background: HexColor(AppColors.appTextSubColor),
        borderColor: HexColor(AppColors.appTextSubColor),
        click: () async {
          await _controller.whatsapp(phone: contact.phone);
        }),
  );
}
