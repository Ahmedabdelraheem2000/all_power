import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_text.dart';
import 'package:hire_me/utils/constants.dart';

class DoneApplyJobScreen extends StatelessWidget {

  // TODO icon_done_apply_job.png

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3), () => Get.offAndToNamed(Routes.home));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('${Const.icons}icon_done_apply_job.png'),
            SizedBox(height: 22.h),
            AppText.larg(text: 'done_send_request',
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center),
            SizedBox(height: 12.h),
            AppText.medium(text: 'will_contact_you_soon',
            textAlign: TextAlign.center),

          ],
        ),
      ),
    );
  }
}
