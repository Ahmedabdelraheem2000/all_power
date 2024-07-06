import 'package:url_launcher/url_launcher.dart';

class GoogleMapUtils{

  GoogleMapUtils._();

  static Future<void> openGoogleMap({required double latitude, required double longitude}) async {
    String googleMapUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if(await canLaunchUrl(Uri.parse(googleMapUrl))){
      await launchUrl(Uri.parse(googleMapUrl));
    }else{
      throw 'Could not open google map';
    }
  }
}