import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_round_chargemod/cubits/Authentication/auth_state_cubit.dart';
import 'package:technical_round_chargemod/screens/otp_screen/otp_scree.dart';
import 'package:technical_round_chargemod/widgets/common/errorDialogBox.dart';
import 'package:technical_round_chargemod/widgets/loginpage/countrypicker.dart';
import 'package:technical_round_chargemod/widgets/loginpage/loginbutton.dart';
import 'package:technical_round_chargemod/widgets/loginpage/logintextform.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = "";

  void error() async {
    if (await Vibrate.canVibrate) {
      Vibrate.feedback(FeedbackType.heavy);
    }
  }

  @override
  Widget build(BuildContext context) {
    String PhoneNO = GetStorage().read('LoginGetNumber') ?? 'No data available';
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => AuthStateCubit(),
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height / 6,
                ),
                isDark == true
                    ? SvgPicture.asset(
                        'assets/images/dark_theme_image/login_screen/Group 33861 (2).svg')
                    : SvgPicture.asset(
                        'assets/images/light_theme_image/login_screen/Group 33861 (1).svg'),
                SizedBox(
                  height: height / 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                        width: width / 5,
                        child: const login_countrypicker()),
                    SizedBox(width: width / 25),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                        width: width / 2 + 20,
                        child: Login_textForm()),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: width / 10, right: width / 10, top: width / 30),
                    child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 16,
                        child: BlocConsumer<AuthStateCubit, AuthState>(
                            listener: (context, state) {
                          if (state is AuthLoginState) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => AuthStateCubit(),
                                child: OtpScreen(),
                              ),
                            ));
                          } else if (state is AuthErrorState) {
                            error();
                            ErrorDialogueBox.show(
                                context, "CAUTION", state.error);
                          }
                        }, builder: (context, state) {
                          if (state is AuthLoDInGState) {
                            return CircularProgressIndicator();
                          }
                          return LoginButton(
                            ontap: () {
                              BlocProvider.of<AuthStateCubit>(context)
                                  .LoginPage("$PhoneNO");
                            },
                          );
                        }))),
                SizedBox(
                  height: height / 2 - 50,
                ),
                isDark == true
                    ? SvgPicture.asset(
                        'assets/images/dark_theme_image/login_screen/By Continuing you agree to our Terms & Condition and Privacy Policy (4).svg')
                    : SvgPicture.asset(
                        'assets/images/light_theme_image/login_screen/By Continuing you agree to our Terms & Condition and Privacy Policy (3).svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
