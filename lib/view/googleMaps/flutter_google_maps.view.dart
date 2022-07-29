import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FlutterGoogleMapPractice extends StatefulWidget {
  const FlutterGoogleMapPractice({Key? key}) : super(key: key);

  @override
  State<FlutterGoogleMapPractice> createState() =>
      _FlutterGoogleMapPracticeState();
}

class _FlutterGoogleMapPracticeState extends State<FlutterGoogleMapPractice> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition kGooglePosition = CameraPosition(
    target: LatLng(25.435801, 81.846313),
    zoom: 14.6,
  );

  final List<Marker> _marker = [];
  final List<Marker> _listOfMarkers = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(25.435801, 81.846313),
      infoWindow: InfoWindow(title: "My position"),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(26.435801, 82.846313),
      infoWindow: InfoWindow(title: "My position"),
    ),
    Marker(
      markerId: MarkerId("3"),
      position: LatLng(23.435801, 80.846313),
      infoWindow: InfoWindow(title: "My position"),
    )
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_listOfMarkers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        initialCameraPosition: kGooglePosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(_marker),
      ),
    );
  }
}
