import 'dart:async';

import 'package:devbybit/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GooglePolylines extends StatefulWidget {
  GooglePolylines({Key key}) : super(key: key);

  @override
  MyState createState() {
    return MyState();
  }
}

class MyState extends State<GooglePolylines>
    with SingleTickerProviderStateMixin {
  final globalKey = GlobalKey<ScaffoldState>();

  PointLatLng origin = PointLatLng(-1.4203339, 36.9520678);
  PointLatLng destination = PointLatLng(-1.230838, 36.6640055);

  Completer<GoogleMapController> _controller = Completer();
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  PolylineResult polylineResult = PolylineResult();

  @override
  void initState() {}

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    setPolylines();
  }

  setPolylines() async {
    PolylineResult polylineResult =
        await PolylinePoints().getRouteBetweenCoordinates(
            GoogleApiKey, //USE YOUR GOOGLE API KEY HERE
            origin,
            destination);

    polylineResult.points.forEach((PointLatLng point) {
      print(point.latitude.toString()+","+ point.longitude.toString());
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    });

    setState(() {
      Polyline polyline = Polyline(
          polylineId: PolylineId('poly'),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      _polylines.add(polyline);

    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
        zoom: 13,
        bearing: 30,
        tilt: 0,
        target: new LatLng(origin.latitude, origin.longitude));

    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text("Google Maps Polylines",
            style: TextStyle(fontSize: 16, fontFamily: "SegoeBold")),
      ),
      body: GoogleMap(
          myLocationEnabled: true,
          compassEnabled: true,
          tiltGesturesEnabled: false,
          polylines: _polylines,
          mapType: MapType.normal,
          initialCameraPosition: initialLocation,
          onMapCreated: onMapCreated),
    );
  }
}

class MapUtils {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
}
