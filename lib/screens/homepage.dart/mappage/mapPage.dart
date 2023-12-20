import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/mappage/Google_map/googlemap_page.dart';
import 'package:technical_round_chargemod/widgets/homepage/mapPage/mapPageView.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Scaffold(
              body: Stack(
            children: [
              GoogleMapPage(),
              MapPageSlidingView(),
            ],
          )),
        ],
      ),
    );
  }
}
