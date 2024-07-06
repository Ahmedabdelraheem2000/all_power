import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:hire_me/model/apply_job/apply_extra_job.dart';
import 'package:hire_me/model/apply_job/apply_main_job.dart';
import 'package:hire_me/model/auth/auth.dart';
import 'package:hire_me/model/auth/disable_account.dart';
import 'package:hire_me/model/auth/edit_profile.dart';
import 'package:hire_me/model/auth/logout.dart';
import 'package:hire_me/model/days.dart';
import 'package:hire_me/model/error_message.dart';
import 'package:hire_me/model/extra_jobs/extra_jobs.dart';
import 'package:hire_me/model/extra_sections/extra_sections.dart';
import 'package:hire_me/model/main_jobs/main_job_details.dart';
import 'package:hire_me/model/main_jobs/main_jobs.dart';
import 'package:hire_me/model/notification/notifications.dart';
import 'package:hire_me/model/schedule/schedule.dart';
import 'package:hire_me/model/sections/sections.dart';
import 'package:hire_me/model/slider.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'api_helper.dart';

class ApiRequests {
  static final _client = http.Client();

  static Future<Auth?> register(
      {required String name,
      required String idCard,
      required String email,
      required String phone,
      required String dateOfBirth,
      required String gender,
      required String password}) async {
    print('NAME: $name');
    print('ID CARD: $idCard');
    print('EMAIl: $email');
    print('PHONE: $phone');
    print('DATE: $dateOfBirth');
    print('GENDER: $gender');
    print('PASSWORD: $password');
    http.Response response = await _client.post(Uri.parse(ApiHelper.REGISTER),
        headers: ApiHelper.headers(),
        body: <String, dynamic>{
          'name': name,
          'id_card': idCard,
          'email': email,
          'phone': phone,
          'birth_date': dateOfBirth,
          'gender': gender,
          'password': password
        },
        encoding: Encoding.getByName('utf-8'));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Auth auth = Auth.fromJson(body);
      // print('SUUCESS register: ${jsonEncode(auth)}');
      return auth;
    } else {
      print('ERROR register: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Auth?> login(
      {required String language,
      required String phone,
      required String password}) async {
    http.Response response = await _client.post(Uri.parse(ApiHelper.LOGIN),
        headers: ApiHelper.headers(),
        body: <String, dynamic>{'phone': phone, 'password': password},
        encoding: Encoding.getByName('utf-8'));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Auth auth = Auth.fromJson(body);
      // print('SUCCESS login: ${jsonEncode(auth)}');
      return auth;
    } else {
      var body = jsonDecode(response.body);
      ErrorMessage message = ErrorMessage.fromJson(body);
      AppHelper.showToast(message: message.msg!, color: Colors.redAccent);
      print('ERROR login: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<EditProfile?> editProfile({
    required String language,
    required String token,
    required String image,
    required String name,
    required String email,
    required String idCard,
    required String phone,
    required String dateOfBirth,
    required String gender,
  }) async {
    print('IMAGE: $image');
    print('name: $name');
    print('EMAIL: $email');
    print('idCard: $idCard');
    print('PHONE: $phone');
    print('DATE: $dateOfBirth');
    print('GENDER: $gender');
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiHelper.UPDATE_PROFILE));
    request.files.add(await http.MultipartFile.fromPath('image', image,
        filename: image.split('/').last));
    request.headers
        .addAll(ApiHelper.allHeader(token: token, language: language));
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['id_card'] = idCard;
    request.fields['birth_date'] = dateOfBirth;
    request.fields['phone'] = phone;
    request.fields['gender'] = gender;
    var response = await request.send();
    var responseBody = await http.Response.fromStream(response);

    if (responseBody.statusCode == 200) {
      var body = jsonDecode(responseBody.body);
      EditProfile profile = EditProfile.fromJson(body);
      print('SUCCES editProfile: ${jsonEncode(profile)}');
      return profile;
    } else {
      print('ERROR editProfile: ${jsonDecode(responseBody.body)}');
      return null;
    }
  }

  static Future<Logout?> logout({required String token}) async {
    http.Response response = await _client.post(Uri.parse(ApiHelper.LOGOUT),
        headers: ApiHelper.tokenHeader(token: token));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Logout logout = Logout.fromJson(body);
      // print('SUCCESS logout: ${jsonEncode(logout)}');
      return logout;
    } else {
      print('ERROR logout: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<DisableAccount?> disableAccount({required String token}) async {
    http.Response response = await _client.post(
        Uri.parse(ApiHelper.DISABLE_ACCOUNT),
        headers: ApiHelper.tokenDeviceHeader(token: token));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      DisableAccount disable = DisableAccount.fromJson(body);
      // print('SUCCESS logout: ${jsonEncode(disable)}');
      return disable;
    } else {
      print('ERROR logout: ${jsonDecode(response.body)}');
      return null;
    }
  }










  static Future<Sections?> getJobSections({required String language}) async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.SECTIONS),
        headers: ApiHelper.langHeader(language: language));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Sections sections = Sections.fromJson(body);
      // print('SUCCESS getJobSections: ${sections}');
      return sections;
    } else {
      print('ERROR getJobSections: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Notifications?> getNotifications(
      {required String language}) async {
    http.Response response = await _client.get(
        Uri.parse(ApiHelper.NOTIFICATIONS),
        headers: ApiHelper.langHeader(language: language));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Notifications notifications = Notifications.fromJson(body);
      // print('SUCCESS getNotifications: ${notifications}');
      return notifications;
    } else {
      print('ERROR getNotifications: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Schedules?> getSchedules(
      {required String date,
      required String language,
      required String token}) async {
    print('date: $date');
    http.Response response = await _client.get(
        Uri.parse('${ApiHelper.MY_SCHEDULE}$date'),
        headers: ApiHelper.allHeader(token: token, language: language));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Schedules schedules = Schedules.fromJson(body);
      // print('SUCCESS getSchedules: ${jsonEncode(schedules)}');
      return schedules;
    } else {
      print('ERROR getSchedules: ${jsonDecode(response.body)}');
      return null;
    }
  }


  static Future<ExtraJobs?> getExtraJobs(
      {required String language,
      required String token,
      required int sectionId,
      required int dayId,
      required String type}) async {
    print('getExtraJobs <-');
    print('SECTION: $sectionId');
    print('DAY: $dayId');
    print('TYPE: $type');
    http.Response response = await _client.get(
        Uri.parse(
            '${ApiHelper.EXTRA_JOBS}?section_id=${sectionId.toString()}&day_id=${dayId.toString()}&type=$type'),
        headers: ApiHelper.allHeader(token: token, language: language));
    print('getExtraJobs: ${response.statusCode}');

    // TODO evening / morning
    if (response.statusCode == 200) {
      // print('getExtraJobs: ${jsonDecode(response.body)}');
      var body = jsonDecode(response.body);
      ExtraJobs extraJobs = ExtraJobs.fromJson(body);
      // print('SUCCESS getExtraJobs: ${jsonEncode(extraJobs)}');
      return extraJobs;
    } else {
      print('ERROR getExtraJobs: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Days?> getDays({required String language}) async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.DAYS),
        headers: ApiHelper.langHeader(language: language));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Days days = Days.fromJson(body);
      // print('SUCCESS getDays: ${jsonEncode(days)}');
      return days;
    } else {
      print('ERROR getDays: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<MainJobs?> getMainJobs(
      {required String language,
      required int sectionId,
      required int jobId}) async {
    http.Response response = await _client.get(
        Uri.parse('${ApiHelper.MAIN_JOBS}section_id=$sectionId&job_id=$jobId'),
        headers: ApiHelper.langHeader(language: language));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      MainJobs jobs = MainJobs.fromJson(body);
      // print('SUUCESS getMaonJobs: ${jsonEncode(jobs)}');
      return jobs;
    } else {
      print('ERROR getMainJobs: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<MainJobDetails?> getMainJobDetails(
      {required String language,
      required int sectionId,
      required int jobId}) async {
    http.Response response = await _client.get(
        Uri.parse('${ApiHelper.MAIN_JOBS}section_id=$sectionId&job_id=$jobId'),
        headers: ApiHelper.langHeader(language: language));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      MainJobDetails job = MainJobDetails.fromJson(body);
      // print('SUUCESS getMaonJobs: ${jsonEncode(job)}');
      return job;
    } else {
      print('ERROR getMainJobs: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<ApplyExtraJob?> applyExtraJob(
      {required String language,
      required String token,
      required int jobId}) async {
    http.Response response = await _client.post(
        Uri.parse(ApiHelper.APPLY_EXTRA_JOB),
        headers: ApiHelper.allHeader(token: token, language: language),
        body: <String, dynamic>{'extra_job_id': jobId.toString()},
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ApplyExtraJob extraJob = ApplyExtraJob.fromJson(body);
      print('SUUCESS applyExtraJob: ${jsonEncode(extraJob)}');
      return extraJob;
    } else {
      print('ERROR applyExtraJob: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<ExtraSections?> getExtraSections(
      {required String language}) async {
    http.Response response = await _client.get(
        Uri.parse(ApiHelper.EXTRA_SECTIONS),
        headers: ApiHelper.langHeader(language: language));

    if (response.statusCode == 200) {
      print('true');
      var body = jsonDecode(response.body);
      ExtraSections sections = ExtraSections.fromJson(body);
      // print('SUUCESS getExtraSections: ${jsonEncode(sections)}');
      return sections;
    } else {
      print('ERROR getExtraSections: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<ApplyMainJob?> sendPdfFile(
      {required String language,
      required String file,
      required int mainJobId}) async {
    print('FILE: $file');
    print('ID: $mainJobId');
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiHelper.APPLY_MAIN_JOB));
    request.files.add(await http.MultipartFile.fromPath('file', file,
        filename: file.split('/').last));
    request.fields['main_job_id'] = mainJobId.toString();
    var response = await request.send();
    var responseBody = await http.Response.fromStream(response);

    if (responseBody.statusCode == 200) {
      var body = jsonDecode(responseBody.body);
      ApplyMainJob job = ApplyMainJob.fromJson(body);
      print('SUUCESS applyMainJob: ${jsonDecode(responseBody.body)}');
      return job;
    } else {
      print('ERROR applyMainJob: ${jsonDecode(responseBody.body)}');
      return null;
    }
  }
}
