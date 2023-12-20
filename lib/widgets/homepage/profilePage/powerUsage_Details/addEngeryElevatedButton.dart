import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEnergyElevatedButton extends StatelessWidget {
  const AddEnergyElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Color.fromRGBO(78, 173, 43, 1),
          ),
          onPressed: () async {
            print("Add Energy button tapped");
            if (await Vibrate.canVibrate) {
              Vibrate.feedback(FeedbackType.medium);
            }
          },
          child: Text(
            "+Add Energy",
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(225, 255, 255, 225),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
