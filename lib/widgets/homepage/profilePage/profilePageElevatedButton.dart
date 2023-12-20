import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePageElevatedButton extends StatelessWidget {
  const ProfilePageElevatedButton(
      {super.key,
      required this.name,
      required this.onTap,
      required this.buttonIcon});
  final String name;
  final void Function() onTap;
  final String buttonIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
          onPressed:onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("${buttonIcon}"),
              SizedBox(
                width: 10,
              ),
              Text(
                '${name}',
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
              ),
            ],
          )),
    );
  }
}
