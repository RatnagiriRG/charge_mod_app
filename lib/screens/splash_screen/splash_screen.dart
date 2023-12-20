import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_round_chargemod/cubits/Authentication/auth_state_cubit.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/homepage.dart';
import 'package:technical_round_chargemod/screens/onBoard/onBoard.dart';
import 'package:technical_round_chargemod/screens/statemanagingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          });
    controller.repeat(reverse: false);

    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => AuthStateCubit(),
          child: stateManagingScreen(),
        ),
      ));
    });
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => AuthStateCubit(),
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: height / 2,
              ),
              isDark == true
                  ? SvgPicture.asset(
                      'assets/images/dark_theme_image/splash_screen/Group 33713 (1).svg')
                  : SvgPicture.asset(
                      'assets/images/light_theme_image/splash_screen/Group 33714 (1).svg'),
              SizedBox(
                height: height / 4,
              ),
              SizedBox(
                width: width - 160,
                child: LinearProgressIndicator(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  color: Theme.of(context).colorScheme.onSecondary,
                  value: controller.value,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              isDark == true
                  ? SvgPicture.asset(
                      'assets/images/dark_theme_image/splash_screen/Connecting to chargeMOD (1).svg')
                  : SvgPicture.asset(
                      'assets/images/light_theme_image/splash_screen/Connecting to chargeMOD (2).svg')
            ],
          ),
        ),
      ),
    );
  }
}
