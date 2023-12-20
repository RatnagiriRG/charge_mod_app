import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:technical_round_chargemod/cubits/Authentication/auth_state_cubit.dart';
import 'package:technical_round_chargemod/data/onBoard/onBoardPages.dart';
import 'package:technical_round_chargemod/screens/login_screen/login_screen.dart';
import 'package:technical_round_chargemod/widgets/onBoard/nextBoardElevetedButton.dart';
import 'package:technical_round_chargemod/widgets/onBoard/skipButton.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;

  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    _pageController;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  void increment() {
    if (currentIndex == Lightcontents.length - 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => LoginScreen()));
    }
    _pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
  }

  void _decrement() {
    _pageController.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => AuthStateCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: height + 50,
              width: width,
              child: SvgPicture.asset(
                  'assets/images/light_theme_image/onBoard/Group 33667 (1).svg'),
            ),
            Column(
              children: [
                Container(
                  height: height - (height - 120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SkipButton(ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => AuthStateCubit(),
                            child: BlocConsumer<AuthStateCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthOnBoard) {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => AuthStateCubit(),
                                      child: LoginScreen(),
                                    ),
                                  ));
                                }
                              },
                              builder: (context, state) {
                                if (state is AuthLoDInGState) {
                                  BlocProvider.of<AuthStateCubit>(context)
                                      .onBRD();
                                }
                                return LoginScreen();
                              },
                            ),
                          ),
                        ));
                      }),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemCount: isDark == true
                        ? Darkcontent.length
                        : Lightcontents.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //heading
                            SvgPicture.asset(isDark == true
                                ? Darkcontent[index].heading
                                : Lightcontents[index].heading),
                            SizedBox(
                              height: height / 15,
                            ),
                            //image
                            Darkcontent[index] == Darkcontent[0] &&
                                    Lightcontents[index] == Lightcontents[0]
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SvgPicture.asset(isDark == true
                                        ? Darkcontent[index].image
                                        : Lightcontents[index].image),
                                  )
                                : Darkcontent[index] == Darkcontent[2] &&
                                        Lightcontents[index] == Lightcontents[2]
                                    ? Image.asset(isDark == true
                                        ? Darkcontent[index].image
                                        : Lightcontents[index].image)
                                    : SvgPicture.asset(isDark == true
                                        ? Darkcontent[index].image
                                        : Lightcontents[index].image),

                            //subtitle
                            SizedBox(
                              height: height / 10,
                            ),

                            SvgPicture.asset(isDark == true
                                ? Darkcontent[index].subtitle
                                : Lightcontents[index].subtitle),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  //color: Colors.amber,
                  height: 100,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      currentIndex == 0
                          ? Container(
                              width: width / 10,
                            )
                          : NextBoardElevatedButton(
                              icon:
                                  'assets/images/widgets/onBoard/Vector (2).png',
                              ontap: () async {
                                _decrement();
                                if (await Vibrate.canVibrate) {
                                  Vibrate.feedback(FeedbackType.medium);
                                }
                              },
                            ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              Lightcontents.length,
                              (index) => buildDot(index, context),
                            )),
                      ),
                      NextBoardElevatedButton(
                        icon: "assets/images/widgets/onBoard/Vector (1).png",
                        ontap: () async {
                          increment();
                          if (await Vibrate.canVibrate) {
                            Vibrate.feedback(FeedbackType.medium);
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.all(10),
      height: currentIndex == index ? 20 : 10,
      width: currentIndex == index ? 20 : 10,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? isDark == false
                  ? Color.fromARGB(190, 0, 0, 0)
                  : const Color.fromARGB(206, 255, 255, 255)
              : isDark == false
                  ? Color.fromARGB(159, 34, 33, 33)
                  : Color.fromARGB(144, 255, 255, 255),
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
