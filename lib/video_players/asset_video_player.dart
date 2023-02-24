import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class AssetVideoPlayer extends StatefulWidget {
  const AssetVideoPlayer({Key? key}) : super(key: key);

  @override
  State<AssetVideoPlayer> createState() => _AssetVideoPlayerState();
}

class _AssetVideoPlayerState extends State<AssetVideoPlayer> {
  late FlickManager _flickManager;

  @override
  void initState() {
    _flickManager = FlickManager(videoPlayerController: VideoPlayerController.asset("videos/JohnWick.mp4"),);
    super.initState();
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(flickManager: _flickManager);
  }
}
