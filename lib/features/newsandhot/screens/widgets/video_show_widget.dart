
import 'package:flutter/material.dart';
import 'package:netflixclone/utils/colors/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoShowWidget extends StatelessWidget {
  const VideoShowWidget({
    super.key,
    required this.videoLink,
  });

  final String videoLink;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
    ),
);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: 200,
            decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                       videoLink),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              right: 10,
              bottom: 10,
              child: CircleAvatar(
                backgroundColor: const Color.fromRGBO(0, 0, 0, 0.078),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_up,
                      color: AppColors.grey,
                    )),
              ))
        ],
      ),
    );
  }
}
