import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class NextBoardElevatedButton extends StatefulWidget {
  const NextBoardElevatedButton(
      {super.key, required this.ontap, required this.icon});
  final void Function() ontap;
  final String icon;

  @override
  State<NextBoardElevatedButton> createState() =>
      _NextBoardElevatedButtonState();
}

class _NextBoardElevatedButtonState extends State<NextBoardElevatedButton> {
  late String iconname;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iconname = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(20),
          backgroundColor: Color.fromRGBO(230, 116, 12, 1),
        ),
        onPressed: widget.ontap,
        child: Image.asset('${widget.icon}'));
  }
}
