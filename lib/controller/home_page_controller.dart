import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/model/job_type.dart';
import 'package:hire_me/model/slider.dart';
import 'package:hire_me/utils/app_helper.dart';
import 'package:hire_me/utils/constants.dart';

class HomePageController extends GetxController {

  List<JobType> listJobType = [
    JobType(id: 1, title: 'fixed_jobs'.tr, isSelected: true),
    JobType(id: 2, title: 'extra_jobs'.tr, isSelected: false),
  ];
  var sliders = <Sliders>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSliders();
  }

  Future<void> fetchSliders() async {
    var url = Uri.parse('http://new.allpower.info/api/sliders');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var sliderList = jsonResponse['result']['sliders'] as List;
      sliders.value =
          sliderList.map((sliderJson) => Sliders.fromJson(sliderJson)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

}
