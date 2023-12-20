import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueUpdatePageButton extends StatelessWidget {
  const ContinueUpdatePageButton({super.key, required this.onatp});
  final void Function() onatp;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
        onPressed: onatp,
        child: Text(
          "COUNTINUE",
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
        ));
  }
}
