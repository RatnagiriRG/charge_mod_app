import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class ContainerIconSelector extends StatelessWidget {
  const ContainerIconSelector(
      {super.key,
      required this.Iconsstring,
      required this.onTap,
      required this.name});
  final String Iconsstring;
  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  if (await Vibrate.canVibrate) {
                    Vibrate.feedback(FeedbackType.light);
                  }
                  onTap;
                },
                child: Row(
                  children: [
                    SvgPicture.asset('${Iconsstring}'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${name}",
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () async {
                    onTap;
                    if (await Vibrate.canVibrate) {
                      Vibrate.feedback(FeedbackType.light);
                    }
                  },
                  icon: SvgPicture.asset(
                    "assets/images/widgets/homepage/ProfilePage/containerIconSelector/Vector (4).svg",
                    color: Theme.of(context).colorScheme.onTertiary,
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            'assets/images/widgets/homepage/ProfilePage/containerIconSelector/Vector 99 (1).svg',
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ],
      ),
    );
  }
}
