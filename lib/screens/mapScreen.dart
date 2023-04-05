import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:make_decisions/resources/colors.dart';

final _placesApiClient = GoogleMapsPlaces(apiKey: 'AIzaSyDprcfIeMnQP5qaRniFxsG0Uhy880aZA50');

class MapScreen extends StatefulWidget {
  String info;
  MapScreen({Key? key,required this.info}) : super(key: key);
  
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen>{
  late GoogleMapController googleMapController;
  
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }
  
  void _getCurrentLocation() async {
  Position position = await _determinePosition();
  
  googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 16)));

  final Uint8List userIcon = await getBytesFromAsset('assets/images/userCurrent1.png', 130);
  markers.add(
    Marker(
      icon: BitmapDescriptor.fromBytes(userIcon),
      markerId: const MarkerId('currentLocation'),
      position: LatLng(position.latitude, position.longitude)
    )
  );

  await _searchPlaces(widget.info);
  setState(() {});
}

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(16.4740, 102.8220),
    zoom: 15,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: notgrey,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_rounded,),
        ),floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
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
      keyword: widget.info
    );

  if (places.status == "OK" && places.results.isNotEmpty) {
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 16)));

    // Clear previous markers

    // Add new markers for the nearby restaurants
    
    final Uint8List foodIcon = await getBytesFromAsset('assets/images/foodMarker1.png', 130);
    for (var result in places.results) {
      final marker = Marker(
        icon: BitmapDescriptor.fromBytes(foodIcon),
        markerId: MarkerId(result.placeId),
        position: LatLng(result.geometry!.location.lat, result.geometry!.location.lng),
        infoWindow: InfoWindow(title: result.name),
      );
      markers.add(marker);
    }
    //googleMapController.showMarkerInfoWindow(MarkerId(places.results[0].placeId));

    setState(() {});
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('No restaurants found nearby.'),
    ));
  }
}
Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}
}