import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool isFullScreen = false;
  bool _isSliderDragging = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..addListener(() {
      if (_controller.value.hasError) {
        print("Video Player Error: ${_controller.value.errorDescription}");
      }

      // Only update the UI when not dragging the slider
      if (!_isSliderDragging) {
        setState(() {}); // Update the UI with the new position
      }
    });

    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFullScreen() {
    if (isFullScreen) {
      // Exit full screen mode
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    } else {
      // Enter full screen mode
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
    }
    setState(() {
      isFullScreen = !isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_controller),
                  // Play/Pause button in the center
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying ? _controller.pause() : _controller.play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                      size: 80.0,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: toggleFullScreen,
                    ),
                  ),
                ],
              ),
            )
                : Center(child: CircularProgressIndicator()),
            if (_controller.value.isInitialized)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(formatDuration(_controller.value.position)),
                    Expanded(
                      child: Slider(
                        value: _controller.value.position.inSeconds.toDouble(),
                        min: 0,
                        max: _controller.value.duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _isSliderDragging = true;
                            _controller.seekTo(Duration(seconds: value.toInt()));
                          });
                        },
                        onChangeEnd: (value) {
                          setState(() {
                            _isSliderDragging = false; // Stop dragging
                          });
                        },
                      ),
                    ),
                    Text(formatDuration(_controller.value.duration)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}