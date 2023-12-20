import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityDemo extends StatelessWidget {
  const CommunityDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/common_images/updatepage/download (2).png",
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
