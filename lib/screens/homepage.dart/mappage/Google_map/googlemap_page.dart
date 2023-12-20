import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _initailPosistion =
      CameraPosition(target: LatLng(8.7043518, 76.9360561), zoom: 10);

  final List<Marker> myMarker = [];

  Future<String> loadJsonData() async {
    return await rootBundle
        .loadString('lib/data/mapPage/dummy_Locationdata.json');
  }

  @override
  void initState() {
    super.initState();
    fetchMarker;
    FutureBuilder;
  }

  List<Marker> fetchMarker = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            FutureBuilder(
              future: loadJsonData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final String? jsonData = snapshot.data;
                  final Map<String, dynamic> data = json.decode(jsonData!);
                  final List<dynamic> locations = data['data']['result'];

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      final location = locations[index];

                      Map geoLocation = location['geoLocation'];
                      List coordinates = geoLocation['coordinates'];
                      final double longitude = coordinates[0];
                      final double latitude = coordinates[1];
                      final int locationId = location['locationId'];

                      fetchMarker = [
                        Marker(
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueGreen),
                            markerId: MarkerId('${locationId}'),
                            position: LatLng(latitude, longitude))
                      ];
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: height,
              width: width,
              child: GoogleMap(
                markers: Set<Marker>.from(fetchMarker),
                initialCameraPosition: CameraPosition(
                    target: LatLng(8.7043518, 76.9360561), zoom: 10),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
