// import 'package:get/get.dart';
// import 'package:untitled1/api/api_requestes.dart';
// import 'package:untitled1/model/slider.dart'; // Adjust the import path based on your project structure
//
// class SliderController extends GetxController {
//   var isLoading = true.obs; // Observable boolean to track loading state
//   var sliders = <Slider>[].obs; // Observable list to store sliders
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchSliders();
//   }
//
//   void fetchSliders() async {
//     try {
//       isLoading(true); // Set loading state to true
//       var slidersResult = await ApiRequests.getSliders(language: 'en'); // Adjust language as per your requirement
//       if (slidersResult != null) {
//         sliders.assignAll(slidersResult.result?.sliders ?? []);
//       }
//     } finally {
//       isLoading(false); // Set loading state to false regardless of success or failure
//     }
//   }
// }
