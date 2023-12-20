import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class NameFieldUpdate extends StatefulWidget {
  const NameFieldUpdate({super.key});

  @override
  State<NameFieldUpdate> createState() => _NameFieldUpdateState();
}

class _NameFieldUpdateState extends State<NameFieldUpdate> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          GetStorage().write('nameFieldGet', value);
        });
      },
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        label: _controller.text.isEmpty
            ? Text(
                "First name",
                style: GoogleFonts.poppins(
                    fontSize: 12, color: Color.fromRGBO(102, 103, 102, 0.5)),
              )
            : Text(''),
        filled: true,
        fillColor: Color.fromRGBO(228, 223, 223, 1),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(228, 223, 223, 1)),
          borderRadius: BorderRadius.circular(7),
        ),
        focusColor: Color.fromRGBO(230, 116, 12, 1),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Color.fromRGBO(228, 223, 223, 1))),
      ),
    );
  }
}
