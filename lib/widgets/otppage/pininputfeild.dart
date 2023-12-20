import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_round_chargemod/cubits/Provider/otpPage/otpPinProvier.dart';

class PinInputFeild extends StatefulWidget {
  const PinInputFeild({super.key});

  @override
  State<PinInputFeild> createState() => _PinInputFeildState();
}

class _PinInputFeildState extends State<PinInputFeild> {
  String pin1 = '';
  var pin2 = '';
  var pin3 = '';
  var pin4 = '';
  TextEditingController p1 = TextEditingController();
  TextEditingController p2 = TextEditingController();
  TextEditingController p3 = TextEditingController();
  TextEditingController p4 = TextEditingController();
  final formkey = GlobalKey<FormState>();
  late var otpPinString;

  void _setOTP() {
    setState(() {
      otpPinString = '${p1.text}${p2.text}${p3.text}${p4.text}';
    });
  }

  @override
  void initState() {
    p1;

    p2;
    p3;
    p4;
    super.initState();
  }

  @override
  void dispose() {
    p1.dispose();
    p2.dispose();
    p3.dispose();
    p4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 70, top: 30, bottom: 20),
      child: Form(
          key: formkey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 55,
                width: 55,
                child: TextFormField(
                  controller: p1,
                  style: GoogleFonts.poppins(
                      color: Color.fromRGBO(83, 75, 74, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                      _setOTP();
                      setState(() {
                        GetStorage().write('OTPPINGet', otpPinString);
                      });
                    }
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Color.fromRGBO(230, 116, 12, 1),
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(228, 223, 223, 1),
                    filled: true,
                    focusColor: Color.fromRGBO(230, 116, 12, 1),
                    hoverColor: Color.fromRGBO(35, 34, 34, 1),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(228, 223, 223, 1)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(228, 223, 223, 1))),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: 55,
                child: TextFormField(
                  controller: p2,
                  style: GoogleFonts.poppins(
                      color: Color.fromRGBO(83, 75, 74, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                      _setOTP();
                      setState(() {
                        GetStorage().write('OTPPINGet', otpPinString);
                      });
                    }
                    value = pin2;
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Color.fromRGBO(230, 116, 12, 1),
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(228, 223, 223, 1),
                    filled: true,
                    focusColor: Color.fromRGBO(230, 116, 12, 1),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(228, 223, 223, 1)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(228, 223, 223, 1))),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: 55,
                child: TextFormField(
                  controller: p3,
                  style: GoogleFonts.poppins(
                      color: Color.fromRGBO(83, 75, 74, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                      _setOTP();
                      setState(() {
                        GetStorage().write('OTPPINGet', otpPinString);
                      });
                    }
                    value = pin3;
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Color.fromRGBO(230, 116, 12, 1),
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(228, 223, 223, 1),
                    filled: true,
                    focusColor: Color.fromRGBO(230, 116, 12, 1),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(228, 223, 223, 1)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(228, 223, 223, 1))),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: 55,
                child: TextFormField(
                  controller: p4,
                  style: GoogleFonts.poppins(
                      color: Color.fromRGBO(83, 75, 74, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                  onChanged: (value) {
                    if (value.length == 1) {
                      _setOTP();
                      setState(() {
                        GetStorage().write('OTPPINGet', otpPinString);
                      });
                    }
                    value = pin4;
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: Color.fromRGBO(230, 116, 12, 1),
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(228, 223, 223, 1),
                    filled: true,
                    focusColor: Color.fromRGBO(230, 116, 12, 1),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(228, 223, 223, 1)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(228, 223, 223, 1))),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
