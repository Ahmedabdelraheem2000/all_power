import 'package:get/get.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/model/notification/notification_data.dart';
import 'package:hire_me/utils/app_helper.dart';

class NotificationController extends GetxController{

  List<NotificationData> listNotifications = [];

  Future<void> getNotifications() async {
    await ApiRequests.getNotifications(language: AppHelper.getAppLanguage())
        .then((value) {
          if(value != null){
            listNotifications.clear();
            listNotifications.addAll(value.result!.notifications!);
          }
    });
  }

}