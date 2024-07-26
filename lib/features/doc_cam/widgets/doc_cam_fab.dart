import 'package:flutter/material.dart';

class DocCamFab extends StatelessWidget {
  final Function() onTap;
  const DocCamFab({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 180),
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        onPressed: onTap,
        child: const Icon(Icons.add),
      ),
    );
  }
}
