// import 'package:flutter/material.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'package:untitled1/api/slider_service.dart';
// import 'package:untitled1/model/slider.dart';
// import 'package:untitled1/utils/app_color.dart';
//
// class HomeSlider extends StatefulWidget {
//   const HomeSlider({super.key});
//
//   @override
//   State<HomeSlider> createState() => _HomeSliderState();
// }
//
// class _HomeSliderState extends State<HomeSlider> {
//   late Future<SliderResponse> futureSliders;
//   final SliderService _sliderService = SliderService();
//
//   @override
//   void initState() {
//     super.initState();
//     futureSliders = _sliderService.fetchSliders();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//
//     return  Center(
//       child: Container(
//         margin: EdgeInsets.only(top: 20.r),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: FutureBuilder<SliderResponse>(
//           future: futureSliders,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else if (snapshot.hasData) {
//               final sliders = snapshot.data!.result.sliders;
//               return ListView.builder(
//                 itemCount: sliders.length,
//                 itemBuilder: (context, index) {
//                   final slider = sliders[index];
//                   return ImageSlideshow(
//                     width: 360,
//                     height: 280,
//                     initialPage: 0,
//                     indicatorRadius: 5,
//                     indicatorColor: AppColors.darkMainColor,
//                     indicatorBackgroundColor: AppColors.grayColor,
//                     autoPlayInterval: 5000,
//                     isLoop: true,
//                     children: controller.listSliders.map((image) => InkWell(
//                       child: Container(
//                         width: double.infinity,
//                         height: double.infinity,
//                         child: Image.network(
//                           slider.imageUrl!,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       onTap: () => launchUrl(Uri.parse(image.sliderUrl!)),
//                     )).toList(),
//                   );
//                 },
//               );
//             } else {
//               return Center(child: Text('No sliders found'));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
