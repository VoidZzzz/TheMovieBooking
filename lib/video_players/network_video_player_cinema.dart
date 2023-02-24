import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class NetworkVideoPlayerCinema extends StatefulWidget {
  const NetworkVideoPlayerCinema({Key? key}) : super(key: key);

  @override
  State<NetworkVideoPlayerCinema> createState() => _NetworkVideoPlayerCinemaState();
}

class _NetworkVideoPlayerCinemaState extends State<NetworkVideoPlayerCinema> {
  late FlickManager _flickManager;

  @override
  void initState() {
    _flickManager = FlickManager(videoPlayerController: VideoPlayerController.network("https://media.istockphoto.com/id/472702505/video/premiere-after-showing-1.mp4?s=mp4-640x640-is&k=20&c=g_JlMCaQBnew4bLLF_hv5gmPC3Mx4RHv5A1PnZ9S8SA="),);
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
