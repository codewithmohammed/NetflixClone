import 'package:flutter/material.dart';

class AppBarAndIndicator extends StatelessWidget {
  const AppBarAndIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(5),
        child: Image.asset(
          'assets/images/netflixLogo/netflix.png',
          width: 10,
          height: 10,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: const Text(
              'PRIVACY',
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {},
            child: const Text(
              'LOG IN',
              style: TextStyle(color: Colors.white),
            )),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ],
    );
  }
}
