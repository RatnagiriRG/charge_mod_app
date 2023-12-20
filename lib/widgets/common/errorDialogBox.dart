// custom_dialog.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorDialogueBox {
  static Future<void> show(
      BuildContext context, String title, String content) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.info_outlined,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
              SizedBox(
                width: 5,
              ),
              Text(title,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onTertiary,
                      fontWeight: FontWeight.w800)),
            ],
          ),
          content: Text(content,
              style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.w700)),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK",
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontWeight: FontWeight.w700))),
          ],
        );
      },
    );
  }
}
