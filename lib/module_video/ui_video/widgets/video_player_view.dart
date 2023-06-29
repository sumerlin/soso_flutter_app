import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/utils/LoggerUtil.dart';
import 'package:video_player/video_player.dart';

import 'controller_overlay.dart';

/// Stateful widget to fetch and then display video content.
///
final overlayKey = GlobalKey(debugLabel: 'overlayKey');

class VideoPlayerView extends StatefulWidget implements ControllerOverlayCallback {
  VideoPlayerView({
    Key? key,
    required this.url,
    this.smallScreenCallback,
    this.fullScreenCallback,
    this.nextSourceCallback,
  }) : super(key: key);

  String url;

  @override
  _VideoAppState createState() => _VideoAppState();

  @override
  VoidCallback? fullScreenCallback;

  @override
  VoidCallback? nextSourceCallback;

  @override
  VoidCallback? smallScreenCallback;
}

class _VideoAppState extends State<VideoPlayerView> {
  late VideoPlayerController _controller;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  Future<bool> started() async {
    try {
      if (!_controller.value.isInitialized) {
        await _controller.initialize();
      }
      await _controller.play();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = width * 0.56;
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    var height = 9 / 16 * screenWidth;
    loggerSingle("MediaQueryData...." + queryData.toString());
    return FutureBuilder(
      future: started(),
      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done && _controller.value.isInitialized) {
          return Container(
            height: height,
            width: screenWidth,
            color: Colors.black,
            // padding: EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.loose,
              children: [
                _buildVideoView(),
                _buildVideoViewOverlay(),
              ],
            ),
          );
        } else {
          return Container(
            height: height,
            width: screenWidth,
            color: const Color(0xff000000),
          );
        }
      },
    );
    // Center(
    //   child: _controller.value.isInitialized
    //       ? AspectRatio(
    //           aspectRatio: _controller.value.aspectRatio,
    //           child: VideoPlayer(_controller),
    //         )
    //       : Container(),
    // ),
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {
    //     setState(() {
    //       _controller.value.isPlaying ? _controller.pause() : _controller.play();
    //     });
    //   },
    //   child: Icon(
    //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //   ),
    // ),
  }

  Widget _buildVideoView() {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }

  Widget _buildVideoViewOverlay() {
    return PlayerControllerOverlay(
      key: overlayKey,
      player: _controller,
      isFullScreen: isFullScreen,
      smallScreenCallback: () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        setState(() {
          isFullScreen = false;
        });
        widget.smallScreenCallback?.call();
      },
      fullScreenCallback: () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
        setState(() {
          isFullScreen = true;
        });
        widget.fullScreenCallback?.call();
      },
      nextSourceCallback: widget.nextSourceCallback,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
