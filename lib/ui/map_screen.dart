import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hire_me/utils/app_color.dart';
import 'package:hire_me/utils/constants.dart';

class MapScreen extends StatefulWidget {

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  // TODO AIzaSyA77MBkHfxjQXHDjDzJ_RT6pnWKFJd6MIo

  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();

    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        '${Const.icons}icon_current_location.png')
        .then((icon) {
      setState(() {
        _markers.add(Marker(
          markerId: const MarkerId('3'),
          icon: icon,
          position: const LatLng(31.766808, 35.219532),
        ));
        // customIcon = icon;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO 31.766808, 35.219532
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            markers: Set<Marker>.from(_markers),
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(31.766808, 35.219532),
              zoom: 12,
              // widget.place != null ? 8.999999999 : 12
            ),
            myLocationButtonEnabled: true,
            onTap: (position) {},
            onCameraMove: (position) {},
            onMapCreated: (mapController) {},
          ),
        ],
      ),
    );
  }
}