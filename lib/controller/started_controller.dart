import 'package:get/get.dart';
import 'package:hire_me/api/api_requestes.dart';
import 'package:hire_me/model/settings.dart';
import 'package:hire_me/routes/routes.dart';

class StartedController extends GetxController{
  var isLoading = true.obs;
  var apiResponse = ApiResponse(status: false, msg: '').obs;


  @override
  void onInit() {
    // startApp();
    fetchSettings();
    super.onInit();
  }

  Future startApp() {
    return Future.delayed(
        const Duration(seconds: 3), () => Get.offAndToNamed(Routes.home));
  }
  Future fetchSettings() async {
    try {
      isLoading(true);
      var response = await ApiRequests().fetchApiResponseSettings();
      apiResponse(response);
    } catch (e) {
      print("Error fetching settings: $e");
    } finally {
      isLoading(false);
    }
  }
}