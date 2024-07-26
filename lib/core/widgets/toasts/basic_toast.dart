import 'package:flutter/material.dart';

class BasicToast extends StatelessWidget {
  final String text;
  const BasicToast(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
