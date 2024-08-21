import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflixclone/features/fastlaugh/presentation/widgets/icon_with_title_shadow.dart';
import 'package:netflixclone/utils/icons/custom_icons_icons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoListItems extends StatefulWidget {
  const VideoListItems({
    super.key,
    required this.ytkey,
    required this.index,
  });
  final String ytkey;
  final int index;

  @override
  State<VideoListItems> createState() => _VideoListItemsState();
}

class _VideoListItemsState extends State<VideoListItems> {

  late YoutubePlayerController _videocontroller;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=${widget.ytkey}');
    _videocontroller = YoutubePlayerController(
      
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: true,disableDragSeek: true));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Transform.scale(
            scale: 1.75,
            child: Transform.rotate(
                   angle: pi/180*90,
              child: YoutubePlayer(
                aspectRatio: 16 / 9,
                controller: _videocontroller,
                showVideoProgressIndicator: false,
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(
                    isExpanded: true,
                    colors: const ProgressBarColors(
                        playedColor: Colors.blue, handleColor: Colors.blueAccent),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 20,
            bottom: 50,
            child: SizedBox(
              height: 325,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(157, 0, 0, 0),
                          blurRadius: 10,
                          offset: Offset(5, 0))
                    ]),
                    child: const CircleAvatar(),
                  ),
                  const IconWithTitleShadow(
                      title: 'LOL', icon: CustomIcons.laugh_beam),
                  // kWidth,
                  const IconWithTitleShadow(
                      title: 'My List', icon: CustomIcons.plus),
                  // kWidth,
                  const IconWithTitleShadow(
                      title: 'Share', icon: CustomIcons.share),

                  // kWidth,
                  const IconWithTitleShadow(
                      title: 'Play', icon: CustomIcons.play),
                ],
              ),
            ))
      ],
    );
  }
}
