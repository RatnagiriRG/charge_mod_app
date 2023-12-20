import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_round_chargemod/cubits/Authentication/auth_state_cubit.dart';
import 'package:technical_round_chargemod/screens/login_screen/login_screen.dart';
import 'package:technical_round_chargemod/screens/onBoard/onBoard.dart';
import 'package:technical_round_chargemod/widgets/common/errorDialogBox.dart';

class LogoutSnacKBarWithDELETE {
  static Future<void> show(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => AuthStateCubit(),
          child: AlertDialog(
            title: BlocConsumer<AuthStateCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthErrorState) {
                  ErrorDialogueBox.show(context, "Error", state.error);
                }
              },
              builder: (context, state) {
                return Row(
                  children: [
                    Icon(
                      Icons.info_outlined,
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Logout",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontWeight: FontWeight.w800)),
                  ],
                );
              },
            ),
            content: Text("Do you want to Logout or Delete the Account...?",
                style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.w700)),
            actions: [
              Row(
                children: [
                  Icon(
                    Icons.delete_outline_sharp,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                  BlocConsumer<AuthStateCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthDeleteAccountState) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => AuthStateCubit(),
                            child: OnBoard(),
                          ),
                        ));
                      }
                      if (state is AuthErrorState) {
                        ErrorDialogueBox.show(context, "Error", state.error);
                      }
                    },
                    builder: (context, state) {
                      return TextButton(
                          onPressed: () {
                            BlocProvider.of<AuthStateCubit>(context)
                                .DeleteAccount();
                          },
                          child: Text("Delete",
                              style: GoogleFonts.poppins(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  fontWeight: FontWeight.w700)));
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.transit_enterexit_sharp,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                  BlocConsumer<AuthStateCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLogoutState) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => AuthStateCubit(),
                            child: LoginScreen(),
                          ),
                        ));
                      }
                    },
                    builder: (context, state) {
                      return TextButton(
                          onPressed: () {
                            BlocProvider.of<AuthStateCubit>(context).logout();
                          },
                          child: Text("Logout",
                              style: GoogleFonts.poppins(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  fontWeight: FontWeight.w700)));
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
