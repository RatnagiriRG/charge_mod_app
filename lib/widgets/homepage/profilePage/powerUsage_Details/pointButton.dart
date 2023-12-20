import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class Pointbutton extends StatelessWidget {
  const Pointbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.black, width: .25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          onPressed: () async {
            if (await Vibrate.canVibrate) {
              Vibrate.feedback(FeedbackType.medium);
            }
          },
          icon: SvgPicture.asset(
              "assets/images/widgets/homepage/ProfilePage/powerUseage&AddEnergy/Ellipse 99 (1).svg"),
          label: Text("55 Points",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(46, 46, 45, 1)))),
    );
  }
}
