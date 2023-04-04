import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';

final _placesApiClient = GoogleMapsPlaces(apiKey: 'AIzaSyDprcfIeMnQP5qaRniFxsG0Uhy880aZA50');

class MapScreen extends StatefulWidget {
  

  const MapScreen({Key? key}) : super(key: key);
  
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen>{

  late GoogleMapController googleMapController;
  

  Set<Marker> markers = {};

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


          markers.clear();
        
          markers.add(
            Marker(
              icon: await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(1, 1)),"assets/images/userCurrent.png"),
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)
            )
          );
          color: const Color.fromARGB(255, 20, 16, 255);
          icon: const Icon(Icons.man);

          await _searchPlaces("อาหารญี่ปุ่น");
          setState(() {});

        },
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history),
      ),
    );
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      //   child: const Icon(Icons.arrow_forward),
      // ),
  }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
Future<void> _searchPlaces(String query) async {
  Position position = await _determinePosition();
  LatLng latLng = LatLng(position.latitude, position.longitude);

  final places = await _placesApiClient.searchNearbyWithRadius(
      Location(lat: latLng.latitude, lng: latLng.longitude),
      1000,
      type: "restaurant",
      keyword: "อาหารญี่ปุ่น"
    );

  if (places.status == "OK" && places.results.isNotEmpty) {
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 14)));

    // Clear previous markers

    // Add new markers for the nearby restaurants
    for (var result in places.results) {
      final marker = Marker(
        icon: await BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(1, 1)),"assets/images/foodMarker.png"),
        markerId: MarkerId(result.placeId),
        position: LatLng(result.geometry!.location.lat, result.geometry!.location.lng),
        infoWindow: InfoWindow(title: result.name),
      );
      icon: const Icon(Icons.dining);
      color: const Color.fromARGB(255, 198, 13, 0);
      markers.add(marker);
    }

    setState(() {});
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('No restaurants found nearby.'),
    ));
  }
}
}