import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonView extends StatefulWidget {
  const PolygonView({Key? key}) : super(key: key);

  @override
  State<PolygonView> createState() => _PolygonViewState();
}

class _PolygonViewState extends State<PolygonView> {
  //controller
  Completer<GoogleMapController> _controller = Completer();

  //camera position
  CameraPosition kGoogleCameraPosition = CameraPosition(
    target: LatLng(25.435801, 81.846313),
    zoom: 14.6,
  );

  final Set<Marker> _markers = {};
  Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = [
    LatLng(25.435801, 81.856313),
    LatLng(25.445801, 81.866313),
    LatLng(25.455801, 81.876313),
    LatLng(25.465801, 81.886313),
  ];

  @override
  void initState() {
    super.initState();
    _polygon.add(
      Polygon(
        polygonId: PolygonId("1"),
        points: points,
        fillColor: Colors.red,
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.deepOrange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: false,
          compassEnabled: true,
          polygons: _polygon,
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
