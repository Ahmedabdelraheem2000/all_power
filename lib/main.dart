import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hire_me/bindings/app_bindings.dart';
import 'package:hire_me/controller/settings_controller.dart';
import 'package:hire_me/routes/routes.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/local.dart';
import 'package:hire_me/utils/preferences_manager.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await AppHelper.saveDeviceName();
  runApp(const MyApp());}

Future initServices() async {
  await Get.putAsync(() => PreferencesManager().initial());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController _language = Get.put(SettingsController());

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: _language.getAppLocale(),
          translations: MyTranslations(),
          initialBinding: AppBindings(),
          initialRoute: Routes.splash,
          getPages: AppRoutes.routesPages,
        )
    );
  }
}