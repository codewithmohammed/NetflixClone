
import 'package:flutter/material.dart';
import 'package:netflixclone/features/downloads/presentation/widgets/download_image.dart';
import 'package:netflixclone/utils/colors/colors.dart';
import 'package:netflixclone/utils/dimensions/dimensions.dart';
import 'package:netflixclone/utils/widgets/constant_widgets.dart';
import '../../../presentation/appbar/custom_appbar.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cWidth = ScreenDimension.screenWidth(context);
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.maxFinite, 50),
          child: CustomAppBar(
            title: 'Downloads',
          )),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, left: 10),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.settings),
                  kWidth,
                  Text(
                    'Smart Downloads',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 60),
              child: const Text(
                'Introducing Downloads for You',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 50, right: 50, top: 25),
              child: const Text(
                "We'll download a personalized selection of movies and shows for you. so there's always something to watch on your device.",
                style: TextStyle(fontSize: 15, color: AppColors.greylight3),
                textAlign: TextAlign.center,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: cWidth * 0.30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.darkgrey),
                ),
                SizedBox(
                  child: DownloadImage(
                    cWidth: cWidth,
                    angle: -15,
                    margin: const EdgeInsets.only(right: 200, top: 45),
                    index: 0,
                    width: 0.17,
                    height: 0.23,
                  ),
                ),
                DownloadImage(
                  cWidth: cWidth,
                  angle: 15,
                  margin: const EdgeInsets.only(left: 200, top: 45),
                  index: 1,
                  width: 0.17,
                  height: 0.23,
                ),
                DownloadImage(
                  cWidth: cWidth,
                  angle: 0,
                  margin: const EdgeInsets.only(right: 0, top: 30),
                  index: 2,
                  width: 0.18,
                  height: 0.25,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
