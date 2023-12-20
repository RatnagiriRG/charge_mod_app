import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_round_chargemod/cubits/Authentication/auth_state_cubit.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/homepage.dart';
import 'package:technical_round_chargemod/widgets/common/errorDialogBox.dart';
import 'package:technical_round_chargemod/widgets/update_profile.dart/continueupdatepagebutton.dart';
import 'package:technical_round_chargemod/widgets/update_profile.dart/emailfieldUpdaet.dart';
import 'package:technical_round_chargemod/widgets/update_profile.dart/lastnameUpdate.dart';
import 'package:technical_round_chargemod/widgets/update_profile.dart/namefieldUpdate.dart';
import 'package:technical_round_chargemod/widgets/update_profile.dart/updateprofile_formfeild.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String PhoneNOUP =
        GetStorage().read('LoginGetNumber') ?? 'No data available';
    String firstName = GetStorage().read('nameFieldGet') ?? 'No data available';
    String lastName = GetStorage().read('LastFieldGet') ?? 'No data available';
    String email = GetStorage().read('emailFieldGet') ?? 'No data available';

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SizedBox(
          width: width,
          height: height,
          child: Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Update Profile",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  SizedBox(height: height / 30),
                  Text("First name",
                      style: Theme.of(context).textTheme.bodySmall),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: NameFieldUpdate(),
                  ),
                  SizedBox(height: height / 30),
                  Text("Last name",
                      style: Theme.of(context).textTheme.bodySmall),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: LastNameUpdate(),
                  ),
                  SizedBox(height: height / 30),
                  Text("E-mail", style: Theme.of(context).textTheme.bodySmall),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: EmailFieldUpdate(),
                  ),
                  SizedBox(height: height / 30),
                  Text("Phone Number",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text("$PhoneNOUP",
                      style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(
                    height: height / 4,
                  ),
                  SvgPicture.asset(
                      'assets/images/common_images/updatepage/Group 33709 (1).svg'),
                  SizedBox(
                    height: height / 30,
                  ),
                  BlocConsumer<AuthStateCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthErrorState) {
                        ErrorDialogueBox.show(context, "CAUTION", state.error);
                      }
                      if (state is AuthRegisterDetails) {
                        BlocProvider.of<AuthStateCubit>(context).AccessIn();
                      }
                      if (state is AuthGETDATA) {
                        BlocProvider.of<AuthStateCubit>(context).GetData();
                      }
                       if (state is Authserver) {
                        BlocProvider.of<AuthStateCubit>(context).serverHealth();
                      }

                      if (state is AuthAccessState) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => AuthStateCubit(),
                            child: HomePage(),
                          ),
                        ));
                      }
                    },
                    builder: (context, state) {
                      return SizedBox(
                        width: width,
                        height: 40,
                        child: ContinueUpdatePageButton(
                          onatp: () {
                            BlocProvider.of<AuthStateCubit>(context)
                                .registerDetails(
                                    firstName, lastName, email, PhoneNOUP);
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ))),
    );
  }
}
