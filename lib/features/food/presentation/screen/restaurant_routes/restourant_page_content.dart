import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/appbar/appbar_with_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key, required this.restaurantName}) : super(key: key);
  final String restaurantName;

  @override
  State<MapSample> createState() => MapSampleState(restaurantName);
}

class MapSampleState extends State<MapSample> {
  MapSampleState(this.restaurantName);

  final String restaurantName;

  @override
  void initState() {
    super.initState();
  }

  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbarWithButton(restaurantName, true, context),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: Set<Marker>.of(markers.values),
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
          child: FloatingActionButton(
            onPressed: _getLocation,
            child: const Icon(Icons.location_searching),
          ),
        ),
      ),
    );
  }

  Future<void> _getLocation() async {
    final Position getPositionData = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final CameraPosition _position = CameraPosition(
      target: LatLng(getPositionData.latitude, getPositionData.longitude),
      zoom: 17,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position));

    markers.clear();
    const String markerIdVal = 'set';
    const MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
          getPositionData.latitude,
          getPositionData.longitude,
        ));
    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }
}
