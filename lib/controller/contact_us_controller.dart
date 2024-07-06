import 'dart:io';

import 'package:get/get.dart';
import 'package:hire_me/model/contact_us.dart';
import 'package:hire_me/utils/app_helper.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactUsController extends GetxController{

  List<ContactUs> listContactUs = [
    ContactUs(id: 1, title: 'قسم الاكسترا', phone: '+972 58-668-8820'),
    ContactUs(id: 2, title: 'قسم الفنادق والمطاعم', phone: '972 50-919-7500'),
    ContactUs(id: 3, title: 'قسم الميديا', phone: '+972 54-929-9989'),
    ContactUs(id: 4, title: 'قسم الهايتك', phone: '+972 54-733-7663'),
    ContactUs(id: 5, title: 'قسم المخابز والمصانع', phone: '+972 50-977-1750'),
    ContactUs(id: 6, title: 'قسم السوبر', phone: '+972 58-794-0950'),
    ContactUs(id: 7, title: 'قسم الادارة', phone: '+972 50-905-0955'),
    ContactUs(id: 8, title: 'قسم الحسابات', phone: '+972 58-589-9959'),
  ];

  whatsapp({required String phone}) async{
    var contact = "+880123232333";
    var androidUrl = "whatsapp://send?phone=$phone&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$phone?text=${Uri.parse('Hi, I need some help')}";

    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl));
      }
      else{
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception{
      AppHelper.showToast(message: 'WhatsApp is not installed.');
      print('WhatsApp is not installed.');
    }
  }

}