import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          LottieAnimation(),
          CircularProgressIndicator(
            strokeWidth :5,
            color: Colors.redAccent,
          ),
                  ],
                )),
    );
  }
}

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Lottie.network(
        'https://assets1.lottiefiles.com/private_files/lf30_is6flrfu.json',
        repeat: true,
        frameRate: const FrameRate(60),
        fit: BoxFit.contain,
      ),
    );
  }
}
