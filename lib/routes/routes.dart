
import 'package:get/get.dart';

import 'package:hire_me/bindings/login_bindings.dart';
import 'package:hire_me/bindings/register_bindings.dart';
import 'package:hire_me/ui/auth/change_password.dart';
import 'package:hire_me/ui/auth/done_registration_screen.dart';
import 'package:hire_me/ui/auth/login_screen.dart';
import 'package:hire_me/ui/auth/phone_number_screen.dart';
import 'package:hire_me/ui/auth/register_screen.dart';
import 'package:hire_me/ui/auth/verification_screen.dart';
import 'package:hire_me/ui/careers/apply_job_date_screen.dart';
import 'package:hire_me/ui/careers/done_apply_job_screen.dart';
import 'package:hire_me/ui/careers/extra/extra_sections_screen.dart';
import 'package:hire_me/ui/careers/jobs_available_screen.dart';
import 'package:hire_me/ui/careers/jobs_main_sections_screen.dart';
import 'package:hire_me/ui/careers/main_job_details_screen.dart';
import 'package:hire_me/ui/home/home_screen.dart';
import 'package:hire_me/ui/map_screen.dart';
import 'package:hire_me/ui/profile/profile_screen.dart';
import 'package:hire_me/ui/profile/update_profile_screen.dart';
import 'package:hire_me/ui/settings/about_screen.dart';
import 'package:hire_me/ui/settings/connect_screen.dart';
import 'package:hire_me/ui/settings/privacy_policy.dart';
import 'package:hire_me/ui/splash_screen.dart';
import 'package:hire_me/ui/started_screen.dart';


class AppRoutes {

    static final routesPages = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.started, page: () => StartedScreen()),
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen(), binding: LoginBinging()),
    // GetPage(name: Routes.search, page: () => SearchScreen()),
    GetPage(name: Routes.register, page: () => RegisterScreen(), binding: RegisterBinging()),
    GetPage(name: Routes.doneRegistration, page: () => DoneRegistrationScreen()),
    GetPage(name: Routes.profile, page: () => ProfileScreen()),
    GetPage(name: Routes.updateProfile, page: () => UpdateProfileScreen()),
    GetPage(name: Routes.jobsCategories, page: () => JobsCategoriesScreen()),
    GetPage(name: Routes.extraSections, page: () => ExtraSectionsScreen()),
    GetPage(name: Routes.jobsAvailable, page: () => JobsAvailableScreen()),
    GetPage(name: Routes.mainJobDetails, page: () => MainJobDetailsScreen()),
    GetPage(name: Routes.extraJobDate, page: () => ApplyExtraJobDateScreen()),
    GetPage(name: Routes.doneApplyJob, page: () => DoneApplyJobScreen()),
    GetPage(name: Routes.phoneNumber, page: () => PhoneNumberScreen()),
    GetPage(name: Routes.verification, page: () => VerificationScreen()),
    GetPage(name: Routes.changePassword, page: () => ChangeePasswordScreen()),
    GetPage(name: Routes.aboutUs, page: () => AboutScreen()),
    GetPage(name: Routes.contactUs, page: () => ConnectUsScreen()),
    GetPage(name: Routes.privacyPolicy, page: () => PrivacyPolicyScreen()),
    GetPage(name: Routes.map, page: () => MapScreen()),
  ];

}

 class Routes{
  static const splash = '/splash';
  static const started = '/started';
  static const login = '/login';
  static const register = '/register';
  static const doneRegistration = '/done_register';
  static const home = '/home';
  static const search = '/search';
  static const jobsCategories = '/jobs';
  static const extraSections = '/extra_sections';
  static const jobsAvailable = '/available';
  static const mainJobDetails = '/main_job_details';
  static const applyJob = '/apply_job';
  static const extraJobDate = '/apply_job_date';
  static const doneApplyJob = '/done_apply_job';
  static const schedual = '/schedual';
  static const contactUs = '/contact_us';
  static const aboutUs = '/about_us';
  static const privacyPolicy ='/privacy_policy';
  static const profile = '/profile';
  static const updateProfile = '/update_profile';
  static const phoneNumber = '/phone_number';
  static const verification = '/verification';
  static const changePassword = '/change_password';
  static const map = '/map';

}