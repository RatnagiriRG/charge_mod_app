import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.ontap});
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: ontap,
      child: Text(
        "sent OTP",
        style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
      ),
    );
  }
}
