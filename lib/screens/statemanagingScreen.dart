import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_round_chargemod/cubits/Authentication/auth_state_cubit.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/homepage.dart';
import 'package:technical_round_chargemod/screens/login_screen/login_screen.dart';
import 'package:technical_round_chargemod/screens/onBoard/onBoard.dart';
import 'package:technical_round_chargemod/screens/splash_screen/splash_screen.dart';

class stateManagingScreen extends StatelessWidget {
  const stateManagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String StateManage = GetStorage().read('LOAD') ?? 'No data available';

    return Scaffold(
        body: StateManage == "loaded"
            ? BlocProvider(
                create: (context) => AuthStateCubit(),
                child: HomePage(),
              )
            : StateManage == "logout"
                ? BlocProvider(
                    create: (context) => AuthStateCubit(),
                    child: LoginScreen(),
                  )
                : StateManage == "delete"
                    ? BlocProvider(
                        create: (context) => AuthStateCubit(),
                        child: OnBoard(),
                      )
                    : BlocProvider(
                        create: (context) => AuthStateCubit(),
                        child: OnBoard(),
                      ));

    // BlocProvider(
    //     create: (context) => AuthStateCubit(),
    //     child: BlocConsumer<AuthStateCubit, AuthState>(
    //       listener: (context, state) {
    //         if (state is AuthLoginState) {
    //           BlocProvider(
    //             create: (context) => AuthStateCubit(),
    //             child: HomePage(),
    //           );
    //         }
    //         if (state is AuthGETDATA) {
    //           BlocProvider(
    //             create: (context) => AuthStateCubit(),
    //             child: HomePage(),
    //           );
    //         }
    //         if (state is AuthRegisterDetails) {
    //           HomePage();
    //         }
    //       },
    //       builder: (context, state) {
    //         if (state is AuthLoginState) {
    //           return BlocProvider(
    //             create: (context) => AuthStateCubit(),
    //             child: HomePage(),
    //           );
    //         }
    //         if (state is AuthRegisterDetails) {
    //           return HomePage();
    //         }

    //         if (state is AuthLogoutState) {
    //           return BlocProvider(
    //             create: (context) => AuthStateCubit(),
    //             child: LoginScreen(),
    //           );
    //         }
    //         if (state is AuthGETDATA) {
    //           return HomePage();
    //         }
    //         if (GetStorage().write('LOAD', val) ==
    //             (GetStorage().write('LOAD', "login"))) {
    //           return HomePage();
    //         }

    //         return OnBoard();
    //       },
    //     ));
  }
}
