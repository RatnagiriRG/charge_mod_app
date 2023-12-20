import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_round_chargemod/cubits/Authentication/auth_state_cubit.dart';
import 'package:technical_round_chargemod/cubits/Provider/LoginPage/LoginText.dart';
import 'package:technical_round_chargemod/cubits/Provider/otpPage/otpPinProvier.dart';
import 'package:technical_round_chargemod/widgets/common/errorDialogBox.dart';

class resendButtonOtppage extends StatefulWidget {
  const resendButtonOtppage({super.key});

  @override
  State<resendButtonOtppage> createState() => _resendButtonOtppageState();
}

class _resendButtonOtppageState extends State<resendButtonOtppage> {
  bool boolresend = false;
  bool boolVoiceOTP = false;
  bool booltextOTP = false;
  String textVoice = "text";

  void voiceCode() {
    setState(() {
      _countDown = 30;
      textVoice = "voice";
    });
    startTimer();
    booltextOTP = false;
    boolVoiceOTP = true;
  }

  void textCode() {
    setState(() {
      _countDown = 30;
      textVoice = "text";
    });
    startTimer();
    booltextOTP = true;
    boolVoiceOTP = false;
  }

  Timer? _timer;
  int _countDown = 30;

  void onTap() {
    setState(() {
      _countDown = 30;
      boolresend = true;
    });
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown = _countDown - 1;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void error() async {
    if (await Vibrate.canVibrate) {
      Vibrate.feedback(FeedbackType.medium);
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    textCode();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String PhoneNO = GetStorage().read('LoginGetNumber') ?? 'No data available';
    return BlocProvider(
      create: (context) => AuthStateCubit(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<AuthStateCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthErrorState) {
                    ErrorDialogueBox.show(context, "Error", state.error);
                  }
                },
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      context
                          .read<AuthStateCubit>()
                          .ResendOTP("$PhoneNO", "$textVoice");
                      onTap();
                      error();
                    },
                    child: boolresend == true
                        ? Row(
                            children: [
                              Text("Re-send code in",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                " 0:${_countDown.toString()}",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Color.fromRGBO(230, 116, 12, 1)),
                              ),
                            ],
                          )
                        : Text("Resend OTP",
                            style: Theme.of(context).textTheme.bodyMedium),
                  );
                },
              ),
            ],
          ),
          boolresend == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            textVoice = "voice";
                          });
                          voiceCode();
                          context
                              .read<AuthStateCubit>()
                              .ResendOTP("$PhoneNO", "voice");
                        },
                        child: Row(
                          children: [
                            boolVoiceOTP == true
                                ? Row(
                                    children: [
                                      Text(
                                        "Voice-Code in",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        " 0:${_countDown.toString()}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                230, 116, 12, 1)),
                                      )
                                    ],
                                  )
                                : Text(
                                    "Voice-Call",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                          ],
                        )),
                    TextButton(
                        onPressed: () {
                          textCode();
                          context
                              .read<AuthStateCubit>()
                              .ResendOTP("$PhoneNO", "text");
                        },
                        child: Row(
                          children: [
                            booltextOTP == false
                                ? Text(
                                    "Text",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                : Row(
                                    children: [
                                      Text(
                                        "Text-Code in",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        " 0:${_countDown.toString()}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                230, 116, 12, 1)),
                                      )
                                    ],
                                  ),
                          ],
                        ))
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
