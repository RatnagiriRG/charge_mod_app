import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get_storage/get_storage.dart';

import 'package:technical_round_chargemod/cubits/Authentication/auth_state_cubit.dart';
import 'package:technical_round_chargemod/cubits/Provider/LoginPage/LoginText.dart';
import 'package:technical_round_chargemod/cubits/Provider/otpPage/otpPinProvier.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/homepage.dart';
import 'package:technical_round_chargemod/screens/update_profile.dart/update_profile.dart';
import 'package:technical_round_chargemod/widgets/common/errorDialogBox.dart';
import 'package:technical_round_chargemod/widgets/otppage/backbutton.dart';
import 'package:technical_round_chargemod/widgets/otppage/continueOtpbutton.dart';
import 'package:technical_round_chargemod/widgets/otppage/pininputfeild.dart';
import 'package:technical_round_chargemod/widgets/otppage/resendButton.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  void error() async {
    if (await Vibrate.canVibrate) {
      Vibrate.feedback(FeedbackType.heavy);
    }
  }

  @override
  Widget build(BuildContext context) {
    String PhoneNO = GetStorage().read('LoginGetNumber') ?? 'No data available';
    String OTPPIN = GetStorage().read('OTPPINGet') ?? 'No data available';

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: width < 250
            ? const Center(
                child: Text("Width resolution is low : ( "),
              )
            : SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(children: [
                        const SizedBox(width: 60, child: otppageBackbutton()),
                        SizedBox(width: width / 2 - 100),
                        SizedBox(
                            width: width / 2 - 20,
                            child: Text("Verification",
                                style: Theme.of(context).textTheme.bodyMedium)),
                      ]),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(""),
                          Text(
                            "We’ve send you the verification \n code on +91 $PhoneNO",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                          child: BlocConsumer<AuthStateCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthErrorState) {
                            ErrorDialogueBox.show(
                                context, "CAUTION", state.error);
                          }
                          if (state is AuthLoginState) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => AuthStateCubit(),
                                child: HomePage(),
                              ),
                            ));
                          }
                          if (state is AuthVerifyOtpState) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => AuthStateCubit(),
                                child: UpdateProfilePage(),
                              ),
                            ));
                          }
                        },
                        builder: (context, state) {
                          return PinInputFeild();
                        },
                      )),
                      SizedBox(child: resendButtonOtppage()),
                      SingleChildScrollView(
                        child: BlocConsumer<AuthStateCubit, AuthState>(
                          listener: (context, state) {
                            if (state is AuthErrorState) {
                              ErrorDialogueBox.show(
                                  context, "CAUTION", state.error);
                            }
                            if (state is AuthLoginState) {
                              BlocProvider(
                                create: (context) => AuthStateCubit(),
                                child: HomePage(),
                              );
                            }
                            if (state is AuthOtpState) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => AuthStateCubit(),
                                  child: UpdateProfilePage(),
                                ),
                              ));
                            } else if (state is AuthErrorState) {
                              error();
                              ErrorDialogueBox.show(
                                  context, "CAUTION", state.error);
                            }
                          },
                          builder: (context, state) {
                            if (state is AuthLoginState) {
                              BlocProvider(
                                create: (context) => AuthStateCubit(),
                                child: HomePage(),
                              );
                            }
                            return Column(
                              children: [
                                SizedBox(
                                  height: height / 3,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(70),
                                  child: ContinueotpButton(onTap: () {
                                    BlocProvider.of<AuthStateCubit>(context)
                                        .verifyOTP("$PhoneNO", "$OTPPIN");
                                  }),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
