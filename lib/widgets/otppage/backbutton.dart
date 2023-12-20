import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class otppageBackbutton extends StatelessWidget {
  const otppageBackbutton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: SvgPicture.asset(
          'assets/images/widgets/otppage/Group 6 (1).svg',
          color: Theme.of(context).colorScheme.onTertiary,
        ));
  }
}
