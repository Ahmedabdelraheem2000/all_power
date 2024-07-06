import 'package:get/get.dart';
import 'package:hire_me/model/jobs_search.dart';

class SearchController extends GetxController{

  List<JobsSearch> listJobs = [
    JobsSearch(title: 'كل الوظائف', isSelected: true),
    JobsSearch(title: 'فراش', isSelected: false),
    JobsSearch(title: 'طباخ', isSelected: false),
    JobsSearch(title: 'سفرجي', isSelected: false),
    JobsSearch(title: 'فراش', isSelected: false),
    JobsSearch(title: 'سفرجي', isSelected: false),
  ];

}