import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:video_player/video_player.dart';

class NetworkVideoPlayerMovie extends StatefulWidget {
  const NetworkVideoPlayerMovie({Key? key}) : super(key: key);

  @override
  State<NetworkVideoPlayerMovie> createState() =>
      _NetworkVideoPlayerMovieState();
}

class _NetworkVideoPlayerMovieState extends State<NetworkVideoPlayerMovie> {
  late FlickManager _flickManager;

  @override
  void initState() {
    _flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          "https://cdn.videvo.net/videvo_files/video/premium/getty_88/large_watermarked/istock-464772660_preview.mp4"),
    );
    super.initState();
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(flickManager: _flickManager,);
  }
}
