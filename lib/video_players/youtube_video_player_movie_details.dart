import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/widgets/circular_loading_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../data/models/the_movie_api_model.dart';
import '../data/models/the_movie_api_model_impl.dart';

class YouTubeVideoPlayerMovieDetails extends StatefulWidget {
  const YouTubeVideoPlayerMovieDetails({Key? key, required this.movieID})
      : super(key: key);

  final int? movieID;

  @override
  State<YouTubeVideoPlayerMovieDetails> createState() =>
      _YouTubeVideoPlayerMovieDetailsState();
}

class _YouTubeVideoPlayerMovieDetailsState
    extends State<YouTubeVideoPlayerMovieDetails> {
  YoutubePlayerController? _controller;
  String? videoKey;
  final TheMovieApiModel _movieApiModel = TheMovieApiModelImpl();

  @override
  void initState() {
    /// Get Trailer Video from network
    _movieApiModel.getMovieTrailers(widget.movieID ?? 0).then((response) {
      setState(() {
        videoKey = response.results?.last.key ?? "";
        _controller = YoutubePlayerController(
          initialVideoId: videoKey ?? "",
          flags: const YoutubePlayerFlags(autoPlay: false, loop: true),
        );
      });
      debugPrint("======================================> VIDEO KEY $videoKey");
    }).catchError((error) {
      debugPrint(error);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void stopController(){
    _controller?.pause();
  }

  @override
  Widget build(BuildContext context) {
    return (_controller != null)
        ? YoutubePlayer(
            controller: _controller!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: APP_COLOR_SECONDARY_COLOR,
            progressColors: const ProgressBarColors(
                playedColor: APP_COLOR_SECONDARY_COLOR,
                bufferedColor: WHITE_COLOR,
                handleColor: APP_COLOR_SECONDARY_COLOR,
                backgroundColor: GREY_COLOR),
          )
        : const CircularLoadingView();
  }
}


class CircularLoadingView extends StatelessWidget {
  const CircularLoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: APP_COLOR_SECONDARY_COLOR,
      ),
    );
  }

}
