import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.ontap});
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ontap,
        child: Text(
          "SKIP",
          style: Theme.of(context).textTheme.bodyMedium,
        ));
  }
}
