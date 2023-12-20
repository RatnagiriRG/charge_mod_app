import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_round_chargemod/cubits/Authentication/auth_state_cubit.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height,
      child: BlocProvider(
        create: (context) => AuthStateCubit(),
        child:
        
         Scaffold(

          body: 
          
          
          SingleChildScrollView(
            child: BlocConsumer<AuthStateCubit, AuthState>(
              listener: (context, state) {
                
              },
              builder: (context, state) {
                if (state is Authserver) {
                  BlocProvider.of<AuthStateCubit>(context).serverHealth();
                }

                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/common_images/updatepage/server.gif",
                      ),
                      Text(
                        "ServerHealth",
                        style: GoogleFonts.pacifico(
                            fontSize: 30, color: Colors.cyan),
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Time : ",
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(
                            "${GetStorage().read('ServerTime') ?? 'No data available'.toString()},",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Message : ",
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(
                            "${GetStorage().read('Servermessage') ?? 'No data available'.toString()},",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("timestamp : ",
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(
                            "${GetStorage().read('Severtimestamp') ?? 'No data available'.toString()},",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          )
                        ],
                      ),
                     
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
