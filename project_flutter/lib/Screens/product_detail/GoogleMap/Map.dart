
import 'dart:async';
import 'dart:math' show sin, cos, sqrt, atan2, asin;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_flutter/Screens/data/dummy_data.dart';
import 'package:project_flutter/Screens/models/item.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';





class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

double earthRadius = 6371000;

double _originLatitude = 10.853645509037992;
double _originLongitude = 106.65275589736416;
double _destLatitude = 10.855998161390175;
double _destLongitude = 106.65362109694108;
Map<MarkerId, Marker> markers = {};
String title_user = "Your location";
String snippet_user = "Here you are !";
String title_enterprise = "Young Tea Coffee Gò Vấp";
String snippet_enterprise = "This is Tea Coffee !";


PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(_originLatitude, _originLongitude),
    zoom: 15.5,
  );

  double distance_show = 0.0;

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    var d = (12742 * asin(sqrt(a))).toStringAsFixed(1);
    double e = double.parse(d);
    return e;
  }

  double totalDistance = 0.0;

  // late Position _currentPosition;

  // double distanceInMeters = await Geolocator().distanceBetween(
  // _originLatitude,
  // _originLongitude,
  // _destLatitude,
  // _destLongitude,
  // );


  // getUserLocation() async {
  //   _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // }

  //Calculating the distance between two points without Geolocator plugin
  // double getDistance1(lat1, lon1, lat2, lon2){
  //   var dLat = radians(lat2 - lat1);
  //   var dLng = radians(lon2 - lon1);
  //   var a = sin(dLat/2) * sin(dLat/2) + cos(radians(lat1))
  //       * cos(radians(lat2)) * sin(dLng/2) * sin(dLng/2);
  //   var c = 2 * atan2(sqrt(a), sqrt(1-a));
  //   var d = earthRadius * c;
  //   var e = d.toStringAsFixed(1);
  //   double f = double.parse(e);
  //   return f;
  //   //print(d); //d is the distance in meters
  // }

  // getDistance2(){
  //   // totalDistance = Geolocator.distanceBetween(_destLatitude, _destLongitude,
  //   //     _originLatitude, _originLongitude);
  //   totalDistance = Geolocator.distanceBetween(_destLatitude, _destLongitude,
  //       _currentPosition.latitude, _currentPosition.longitude);
  //   //print(distance);
  // }

  @override
  void initState() {
    _addMarker(
      LatLng(_originLatitude, _originLongitude),
      "origin",
      BitmapDescriptor.defaultMarker,
      title_user,
      snippet_user,
    );

    distance_show = _coordinateDistance(_originLatitude,_originLongitude,_destLatitude,_destLongitude);

    //distance_show = getDistance1(_originLatitude,_originLongitude,_destLatitude,_destLongitude);

    _addMarker(
      LatLng(_destLatitude, _destLongitude),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
      title_enterprise,
      snippet_enterprise,
    );

    _getPolyline();

    print("Enter at getpoly");
    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: Navigator.of(context).pop,
          ),
          title: Text(
              'DISTANCE: $distance_show km',
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              polylines: Set<Polyline>.of(polylines.values),
              markers: Set<Marker>.of(markers.values),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ],
        ),
      ),
    );
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor,title,snippet) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(
      markerId: markerId,
      icon: descriptor,
      position: position,
      draggable: true,
      infoWindow: InfoWindow(
        title: title,
        snippet: snippet,
       ),);
    markers[markerId] = marker;
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      color: Colors.redAccent,
      width: 3,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDNI_ZWPqvdS6r6gPVO50I4TlYkfkZdXh8",  // My google API key
      PointLatLng(_originLatitude, _originLongitude),
      PointLatLng(_destLatitude, _destLongitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }
}
