// import 'package:flutter/material.dart';
// import 'package:flutter_hex_color/flutter_hex_color.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:hire_me/controller/search_controller.dart';
// import 'package:hire_me/model/jobs_search.dart';
// import 'package:hire_me/routes/routes.dart';
// import 'package:hire_me/utils/app_color.dart';
// import 'package:hire_me/utils/app_text.dart';
// import 'package:hire_me/utils/components.dart';
// import 'package:hire_me/utils/constants.dart';
//
// class SearchScreen extends StatelessWidget {
//
//   final _controller = Get.put(SearchController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: HexColor(AppColors.appMainColor),
//         elevation: 0,
//         title: AppText.medium(
//             text: 'search',
//             fontSize: 22.sp,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             textAlign: TextAlign.center),
//         toolbarHeight: 60.h,
//         centerTitle: true,
//         actions: [
//           InkWell(
//             child: Container(
//                 margin: const EdgeInsets.only(left: 16, bottom: 4).r,
//                 child: const CircleAvatar(
//                   backgroundImage: NetworkImage('${Const.defaultImage}'),
//                 )),
//             onTap: () => Get.toNamed(Routes.profile),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//               clipBehavior: Clip.antiAlias,
//               margin: EdgeInsetsDirectional.only(
//                   top: 20.r, start: 20.r, end: 20.r),
//               padding: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
//               decoration: BoxDecoration(
//                 color: HexColor(AppColors.formSearchColor),
//                 borderRadius: BorderRadius.circular(20.r),
//               ),
//               child: TextFormField(
//                 keyboardType: TextInputType.text,
//                 cursorColor: Colors.black,
//                 decoration: InputDecoration(
//                     enabled: true,
//                     hintText: 'search_here'.tr,
//                     filled: true,
//                     fillColor: HexColor(AppColors.formSearchColor),
//                     hintStyle: const TextStyle(
//                       color: Color(0xff9B9B9B),
//                       fontSize: 14,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: HexColor(AppColors.formSearchColor),
//                           width: 0.5),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     constraints: BoxConstraints(
//                       maxWidth: 343.w,
//                       maxHeight: 50.h,
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: HexColor(AppColors.formSearchColor),
//                         width: 1.w,
//                       ),
//                       borderRadius: BorderRadius.circular(16.r),
//                     ),
//                     prefixIcon: Container(
//                         height: 8,
//                         width: 8,
//                         child: Image.asset(
//                           '${Const.icons}icon_search_fill.png',
//                           height: 8,
//                           width: 8,
//                         )),
//                     suffixIcon: Container(
//                         height: 8,
//                         width: 8,
//                         child: SvgPicture.asset(
//                           '${Const.icons}icon_clear.svg',
//                           height: 8,
//                           width: 8,
//                           fit: BoxFit.scaleDown,
//                         ))),
//               )),
//           const SizedBox(height: 30),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: GetBuilder<SearchController>(builder: (controller) => Row(
//               children: _controller.listJobs.map((item) => AppWidgets.CustomButton(
//                   height: 40,
//                   width: 120,
//                   background: item.isSelected ? HexColor(AppColors.appTextSubColor) : Colors.white,
//                   text: item.title,
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w500,
//                   textColor: item.isSelected ? HexColor('000000') : HexColor(AppColors.appMainColor),
//                   radius: 20,
//                   marginLeft: 10,
//                   borderWidth: 1,
//                   borderColor: item.isSelected ? HexColor(AppColors.appTextSubColor) : HexColor(AppColors.appMainColor),
//                   click: (){
//                     for(JobsSearch job in _controller.listJobs) {
//                       job.isSelected = false;
//                     }
//
//                     item.isSelected = true;
//                     controller.update();
//                   })
//               ).toList(),
//             )),
//           ),
//           const SizedBox(height: 30),
//           Expanded(
//             child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: 8,
//                 itemBuilder: (context, index) => buildSearchItem()),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget buildSearchItem() => Container(
//     margin: const EdgeInsetsDirectional.only(start:16 ,end: 16),
//     child: Card(
//       margin: EdgeInsets.all(4.r),
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8).r,
//       ),
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin:
//               const EdgeInsetsDirectional.only(start: 12, top: 8),
//               child: AppText.medium(text:
//               'chef'.tr,
//                 color: AppColors.darkMainColor,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 16.sp,
//               ),
//             ),
//             Container(
//               margin:
//               const EdgeInsetsDirectional.only(start: 12, top: 2),
//               child: AppText.medium(text:
//               'Al_Zahraa_Restaurant'.tr,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 14.sp,
//               ),
//             ),
//             Container(
//               margin:
//               const EdgeInsetsDirectional.only(start: 10, top: 5),
//               child: Row(
//                 children: [
//                   Image.asset('${Const.icons}icon_job_address.png'),
//                   SizedBox(
//                     width: 3.w,
//                   ),
//                   AppText.medium(text:
//                   'Jerusalem_Al',
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14.sp,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin:
//               const EdgeInsetsDirectional.only(start: 10, top: 5),
//               child: Row(
//                 children: [
//                   Image.asset('${Const.icons}icon_job_type1.png'),
//                   SizedBox(
//                     width: 3.w,
//                   ),
//                   AppText.medium(text:
//                   'part_time'.tr,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14.sp,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: const EdgeInsetsDirectional.only(
//                   start: 8, top: 8, end: 10, bottom: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Image.asset('${Const.icons}icon_job_date.png'),
//                   SizedBox(
//                     width: 3,
//                   ),
//                   AppText.medium(text:
//                   'hours'.tr,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 10.sp,
//                   ),
//                   const Spacer(),
//                   Image.asset('${Const.icons}icon_apply_job.png'),
//                   const SizedBox(
//                     width: 3,
//                   ),
//                   InkWell(
//                       child: AppText.medium(text:
//                       'Apply_for_the_job'.tr,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 10.sp,
//                       ),
//                       onTap: (){
//                         Get.toNamed(Routes.mainJobDetails);
//                       }
//                   ),
//                   const SizedBox(
//                     width: 11,
//                   ),
//                   Image.asset('${Const.icons}icon_share_job.png'),
//                   const SizedBox(
//                     width: 3,
//                   ),
//                   AppText.medium(text:
//                   'Job_sharing'.tr,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 10.sp,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
