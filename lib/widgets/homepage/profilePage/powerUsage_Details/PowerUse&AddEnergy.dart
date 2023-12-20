import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_round_chargemod/widgets/homepage/profilePage/powerUsage_Details/addEngeryElevatedButton.dart';
import 'package:technical_round_chargemod/widgets/homepage/profilePage/powerUsage_Details/pointButton.dart';

class PowerUsepointAndAddEngergy extends StatelessWidget {
  const PowerUsepointAndAddEngergy({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: 310,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(102, 103, 102, 0.601),
              spreadRadius: 1,
              blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          width: 3,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                width: 340,
                height: 150,
                alignment: Alignment.bottomLeft,
                child: Text(""),
              ),
              Image.asset(
                'assets/images/widgets/homepage/ProfilePage/powerUseage&AddEnergy/background.gif',
                alignment: Alignment.bottomRight,
                height: 150,
                width: 340,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Energy Balance ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(102, 103, 102, 1),
                                  )),
                              Text("99999 kWH",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(46, 46, 45, 1),
                                  )),
                              Text("Added 100 kWH on 20/11/2022",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(102, 103, 102, 1),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                              'assets/images/widgets/homepage/ProfilePage/powerUseage&AddEnergy/Group 33783 (1).svg'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AddEnergyElevatedButton(),
                      SizedBox(
                        width: 60,
                      ),
                      Pointbutton(),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
