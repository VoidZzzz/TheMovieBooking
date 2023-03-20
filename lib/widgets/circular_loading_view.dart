import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/colors.dart';

class CircularLoadingView extends StatelessWidget {
  const CircularLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: APP_COLOR_SECONDARY_COLOR,
      ),
    );
  }
}
