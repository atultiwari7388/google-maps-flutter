import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertToAddress extends StatefulWidget {
  const ConvertToAddress({Key? key}) : super(key: key);

  @override
  State<ConvertToAddress> createState() => _ConvertToAddressState();
}

class _ConvertToAddressState extends State<ConvertToAddress> {
  String stAddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convert LatLng to Address"),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //convert latlng to address
          Center(
            child: ElevatedButton(
              onPressed: () async {
                List<Placemark> placemarks =
                    await placemarkFromCoordinates(25.435801, 81.846313);

                setState(() {
                  // stAddress = placemarks.reversed.last.country.toString() +
                  //     placemarks.reversed.last.locality.toString();

                  // stAddress = placemarks.reversed.last.name.toString();

                  stAddress = placemarks.reversed.last.subLocality.toString();
                });
              },
              child: const Text("Convert"),
            ),
          ),

          Text(stAddress),
        ],
      ),
    );
  }
}
