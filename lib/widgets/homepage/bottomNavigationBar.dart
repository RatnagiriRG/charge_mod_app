import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:technical_round_chargemod/cubits/Provider/Homapage/NavigationBar/navigationBar_cubit.dart';

class BottomNavigationHomePage extends StatefulWidget {
  const BottomNavigationHomePage({super.key});

  @override
  State<BottomNavigationHomePage> createState() =>
      _BottomNavigationHomePageState();
}

class _BottomNavigationHomePageState extends State<BottomNavigationHomePage> {
  int Myindex = 0;

  void _onItemTapped() async {
    if (await Vibrate.canVibrate) {
      Vibrate.feedback(FeedbackType.medium);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 6,
            offset: Offset(5.0, 1.0),
          ),
        ],
      ),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              Myindex = value;
              context
                  .read<HomePageNavigationCubit>()
                  .SelectedNavigationIndex(value);
              _onItemTapped();
            });
          },
          selectedItemColor: Color.fromRGBO(102, 103, 102, 1),
          currentIndex: Myindex,
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                'assets/images/widgets/homepage/navigationBar/Group 33710.svg',
                color: Myindex == 0
                    ? Theme.of(context).colorScheme.onSecondary
                    : Color.fromRGBO(102, 103, 102, 1),
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                'assets/images/widgets/homepage/navigationBar/Group 33711.svg',
                color: Myindex == 1
                    ? Theme.of(context).colorScheme.onSecondary
                    : Color.fromRGBO(102, 103, 102, 1),
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                'assets/images/widgets/homepage/navigationBar/Group 34013 (1).svg',
                color: Myindex == 2
                    ? Theme.of(context).colorScheme.onSecondary
                    : Color.fromRGBO(102, 103, 102, 1),
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset(
                'assets/images/widgets/homepage/navigationBar/Group 33712.svg',
                color: Myindex == 3
                    ? Theme.of(context).colorScheme.onSecondary
                    : Color.fromRGBO(102, 103, 102, 1),
              ),
            ),
          ]),
    );
  }
}
