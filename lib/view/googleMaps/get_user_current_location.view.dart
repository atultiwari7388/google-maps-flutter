import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetCurrentUserLocationView extends StatefulWidget {
  const GetCurrentUserLocationView({Key? key}) : super(key: key);

  @override
  State<GetCurrentUserLocationView> createState() =>
      _GetCurrentUserLocationViewState();
}

class _GetCurrentUserLocationViewState
    extends State<GetCurrentUserLocationView> {
  //controller
  Completer<GoogleMapController> _controller = Completer();

  //camera position
  static const CameraPosition kCameraPosition = CameraPosition(
    target: LatLng(25.435801, 81.846313),
    zoom: 14.6,
  );

  //markers

  final List<Marker> _listOfMarkers = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(25.435801, 81.846313),
      infoWindow: InfoWindow(title: "My position"),
    ),
  ];

  fetchUserLocation() {
    getUserCurrentLocation().then((value) async {
      if (kDebugMode) {
        print(
            "My Current Location\n ${value.latitude.toString()} \n ${value.longitude.toString()}");
      }

      _listOfMarkers.add(
        Marker(
          markerId: MarkerId("2"),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: "My Current Location"),
        ),
      );

      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14.0,
      );

      final GoogleMapController googleMapController = await _controller.future;

      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
    return Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: kCameraPosition,
        markers: Set<Marker>.of(_listOfMarkers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.pin_drop),
      ),
    );
  }
}
