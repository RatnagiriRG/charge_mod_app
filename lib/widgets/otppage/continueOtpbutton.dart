import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueotpButton extends StatelessWidget {
  const ContinueotpButton({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
          onPressed: onTap,
          child: Text(
            'COUNTINUE',
            style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.white),
          )),
    );
  }
}
