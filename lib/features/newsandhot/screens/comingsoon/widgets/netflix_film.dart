import 'package:flutter/material.dart';

import '../../../../../utils/image/image_path.dart';

class NetflixFilm extends StatelessWidget {
  const NetflixFilm({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagePaths.netflix,
            scale: 40,
          ),
           Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(text),
          )
        ],
      ),
    );
  }
}
