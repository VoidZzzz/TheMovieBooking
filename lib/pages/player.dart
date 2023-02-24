import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.network("https://mazwai.com/video/rio-from-above/455099"));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FlickVideoPlayer(
          flickManager: FlickManager(
        videoPlayerController:
        VideoPlayerController.network("https://mazwai.com/video/rio-from-above/455099")),
          flickVideoWithControls:
          const FlickVideoWithControls(
            closedCaptionTextStyle: TextStyle(
              fontSize: 8,
            ),
            controls: FlickPortraitControls(),
          ),
          flickVideoWithControlsFullscreen:
          const FlickVideoWithControls(
            controls: FlickLandscapeControls(),
          ),
        ),
      ),
    );
  }
}
