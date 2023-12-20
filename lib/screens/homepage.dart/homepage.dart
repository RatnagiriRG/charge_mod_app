import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_round_chargemod/cubits/Provider/Homapage/NavigationBar/navigationBar_cubit.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/activitypage/activityPage.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/communitypage/communityPage.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/communitypage/communitydemoPage.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/mappage/mapPage.dart';
import 'package:technical_round_chargemod/screens/homepage.dart/profilepage/profilepage.dart';
import 'package:technical_round_chargemod/widgets/homepage/bottomNavigationBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomePageNavigationCubit(),
        child: BlocBuilder<HomePageNavigationCubit, int>(
          builder: (context, state) {
            return Scaffold(
              body: [
                MapPage(),
                ActivityPage(),
                CommunityDemo(),
                ProfilePage()
              ][state],
              bottomNavigationBar: BottomNavigationHomePage(),
            );
          },
        ));
  }
}
