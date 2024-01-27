import 'package:flutter/material.dart';

class ComingOn extends StatelessWidget {
  const ComingOn({
    super.key,
    required this.onDay,
  });

  final String onDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Coming on $onDay',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
