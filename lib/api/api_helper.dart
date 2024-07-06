

import 'package:hire_me/utils/app_helper.dart';

class ApiHelper {

  static const String _baseUrl = 'http://new.allpower.info/api';
  static const String LOGIN = '$_baseUrl/login';
  static const String REGISTER = '$_baseUrl/register';
  static const String PROFILE = '$_baseUrl/profile';
  static const String UPDATE_PROFILE = '$_baseUrl/save_profile';
  static const String LOGOUT = '$_baseUrl/logout';
  static const String DISABLE_ACCOUNT = '$_baseUrl/status';
  static const String SLIDERS = '$_baseUrl/sliders';
  static const String SECTIONS = '$_baseUrl/get_job_sections';
  static const String NOTIFICATIONS = '$_baseUrl/notification';
  static const String MY_SCHEDULE = '$_baseUrl/my_schedule?date=';
  static const String EXTRA_JOBS = '$_baseUrl/extra_jobs';
  static const String EXTRA_SECTIONS = '$_baseUrl/get_extra_job_sections';
  static const String MAIN_JOBS = '$_baseUrl/main_jobs?';
  static const String DAYS = '$_baseUrl/days';


  static const String APPLY_EXTRA_JOB = '$_baseUrl/add_application_for_extra_job';
  static const String APPLY_MAIN_JOB = '$_baseUrl/add_application_for_main_job';

  static const String SETTINGS = '$_baseUrl/v1/setting';
  static const String CONTACT = '$_baseUrl/v1/contact';

  static Map<String, String> langHeader({required String language}) {
    return {'X-Client-Language': language};
  }

  static Map<String, String> tokenDeviceHeader({required String token}) {
    return {'Authorization': token,
      'X-Client-Device-Name': '${AppHelper.getDeviceName()}'};
  }

  static Map<String, String> tokenHeader({required String token}) {
    return {'Authorization': token};
  }

  static Map<String, String> allHeader({required String token, required String language}) {
    return {'Authorization': token, 'lang': language};
  }

  static Map<String, String> headers() {
    print('DEVICE NAME: ${AppHelper.getDeviceName()}');
    return {'Accept': 'application/json',
      'X-Client-Device-Name': '${AppHelper.getDeviceName()}'};
  }
}
