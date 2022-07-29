import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLineView extends StatefulWidget {
  const PolyLineView({Key? key}) : super(key: key);

  @override
  State<PolyLineView> createState() => _PolyLineViewState();
}

class _PolyLineViewState extends State<PolyLineView> {
//controller

  Completer<GoogleMapController> _controller = Completer();

//initialCameraPosition

  CameraPosition kGoogleCameraPosition = const CameraPosition(
    target: LatLng(25.435801, 81.846313),
    zoom: 14.6,
  );

  //markers

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLine = {};

  // list of lat lang
  List<LatLng> latLng = [
    //current location
    LatLng(25.435801, 81.846313),
    //drop location
    LatLng(27.435801, 82.846313),
    LatLng(28.435801, 83.846313),
    LatLng(29.435801, 84.846313),
    LatLng(30.435801, 85.846313),
    LatLng(31.435801, 86.846313),
    LatLng(32.435801, 87.846313),
    LatLng(33.435801, 88.846313),

    LatLng(25.487601, 81.847713),
    LatLng(25.435991, 81.845513),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < latLng.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: latLng[i],
          infoWindow: InfoWindow(
            title: "My Place",
            snippet: "5 Star rating",
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      setState(() {});
      _polyLine.add(
        Polyline(
          polylineId: const PolylineId("1"),
          points: latLng,
          color: Colors.pink,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          polylines: _polyLine,
          markers: _markers,
          initialCameraPosition: kGoogleCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          // markers: Set<Marker>.of(_marker),
        ),
      ),
    );
  }
}
