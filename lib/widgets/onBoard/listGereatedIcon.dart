import 'package:flutter/material.dart';

class ListGeneratoedBoardIcon extends StatefulWidget {
  const ListGeneratoedBoardIcon({
    super.key,
    required this.length,
    required this.index,
  });
  final int length;
  final int index;

  @override
  State<ListGeneratoedBoardIcon> createState() =>
      _ListGeneratoedBoardIconState();
}

class _ListGeneratoedBoardIconState extends State<ListGeneratoedBoardIcon> {
  late int lenthavailabe;
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lenthavailabe = widget.length;
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => buildDot(index, context),
          )),
    );
  }

  Container buildDot(int index, BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.all(10),
      height: index == index ? 20 : 10,
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
