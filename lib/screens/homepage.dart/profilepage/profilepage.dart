import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_round_chargemod/cubits/Authentication/auth_state_cubit.dart';
import 'package:technical_round_chargemod/widgets/homepage/profilePage/container/containerIcon.dart';
import 'package:technical_round_chargemod/widgets/homepage/profilePage/logoutSnackBar.dart';
import 'package:technical_round_chargemod/widgets/homepage/profilePage/powerUsage_Details/PowerUse&AddEnergy.dart';
import 'package:technical_round_chargemod/widgets/homepage/profilePage/profilePageElevatedButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String firstName = GetStorage().read('FetchName') ?? 'No data available';
    String lastName = GetStorage().read('FetchLast') ?? 'No data available';
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AuthStateCubit(),
      child: SizedBox(
        width: width,
        height: height,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Hai", style: Theme.of(context).textTheme.bodySmall),
                    Text(
                      "$firstName $lastName",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: height / 50),
                    const PowerUsepointAndAddEngergy(),
                    SizedBox(height: height / 30),
                    Container(
                      width: 312,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Theme.of(context).colorScheme.onBackground),
                      child: Column(
                        children: [
                          ContainerIconSelector(
                              name: "My Payment",
                              Iconsstring:
                                  "assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33860 (1).svg",
                              onTap: () {}),
                          ContainerIconSelector(
                              name: "My Electric Vehicle",
                              Iconsstring:
                                  "assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33777 (1).svg",
                              onTap: () {}),
                          ContainerIconSelector(
                              Iconsstring:
                                  "assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33779 (1).svg",
                              onTap: () {},
                              name: 'My Favourite Stations'),
                          ContainerIconSelector(
                              Iconsstring:
                                  'assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33858 (1).svg',
                              onTap: () {},
                              name: 'Alpha Membership')
                        ],
                      ),
                    ),
                    SizedBox(height: height / 50),
                    SizedBox(
                        width: 312,
                        child: ProfilePageElevatedButton(
                          buttonIcon: "",
                          name: "Buy Machines From chargeMOD",
                          onTap: () {},
                        )),
                    SizedBox(height: height / 50),
                    Container(
                      width: 312,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Theme.of(context).colorScheme.onBackground),
                      child: Column(
                        children: [
                          ContainerIconSelector(
                              Iconsstring:
                                  "assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33792.svg",
                              onTap: () {},
                              name: 'My Devices'),
                          ContainerIconSelector(
                              Iconsstring:
                                  'assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33861 (3).svg',
                              onTap: () {},
                              name: 'My Orders'),
                        ],
                      ),
                    ),
                    SizedBox(height: height / 50),
                    Container(
                      width: 312,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Theme.of(context).colorScheme.onBackground),
                      child: Column(
                        children: [
                          ContainerIconSelector(
                              Iconsstring:
                                  "assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33785 (1).svg",
                              onTap: () {},
                              name: 'Help'),
                          ContainerIconSelector(
                              Iconsstring:
                                  'assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33787 (2).svg',
                              onTap: () {},
                              name: 'Raise Complaint'),
                          ContainerIconSelector(
                              Iconsstring:
                                  "assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33863.svg",
                              onTap: () {},
                              name: "About"),
                          ContainerIconSelector(
                              Iconsstring:
                                  "assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33862.svg",
                              onTap: () {},
                              name: 'Privacy Policy')
                        ],
                      ),
                    ),
                    SizedBox(height: height / 50),
                    SizedBox(
                        width: 312,
                        child: ProfilePageElevatedButton(
                          buttonIcon:
                              "assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33788logout.svg",
                          name: "Logout",
                          onTap: () {
                            LogoutSnacKBarWithDELETE.show(context);
                          },
                        )),
                    SizedBox(height: height / 50),
                    SvgPicture.asset(
                        "assets/images/widgets/homepage/ProfilePage/containerIconSelector/Group 33864.svg")
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
