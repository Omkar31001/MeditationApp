import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
class CustomYoutubePlayer extends StatefulWidget {
  final String? youtubeUrl;

  const CustomYoutubePlayer(this.youtubeUrl);

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _controller;
  void initState(){
    _controller = YoutubePlayerController(initialVideoId:YoutubePlayerController.convertUrlToId(widget.youtubeUrl!)!,
      params: YoutubePlayerParams(
        loop: true,
        color: 'transperant',
        desktopMode: true,
        strictRelatedVideos: true,
        showFullscreenButton: !kIsWeb,
      )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: kIsWeb?screenSize.height/1.13 : screenSize.height,
      width: screenSize.width,
      child: YoutubePlayerControllerProvider(
        controller: _controller,
        child: YoutubePlayerIFrame(
          controller: _controller,
        ),
      ),

    );
  }
}
