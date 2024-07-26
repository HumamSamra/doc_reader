import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IconToast extends StatelessWidget {
  final String text;
  final IconData icon;
  const IconToast({
    required this.text,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        Gap(2.w),
        Text(text),
      ],
    );
  }
}
