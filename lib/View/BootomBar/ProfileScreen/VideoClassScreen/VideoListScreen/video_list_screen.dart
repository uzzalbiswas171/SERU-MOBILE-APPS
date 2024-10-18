import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/profile_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

import '../../../../../CustomWidget/CustomAppbar/custom_appbar.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../Routes/routes.dart';
import '../../../../../custom_const.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
  VideoPlayerScreen({required this.url});
  String url;
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool isFullScreen = false;
  bool _isSliderDragging = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
      '${VideoBASEURL}${widget.url}',
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
    return WillPopScope(
      onWillPop: () =>Future(() => false),
      child: Scaffold(
        appBar: PreferredSize(preferredSize:Size.fromHeight(60), child: CustomAppbar()),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back,size: 30,color: BootomBarColor),
          onPressed: () => Navigator.pop(context),),
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
                  : Container(
                  height: 270,
                  width: double.infinity,
                  child: Center(child: CircularProgressIndicator())),
              if (_controller.value.isInitialized)
                /// video play start here------------------------
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

              Consumer<ProfileController>(
              builder: (context, value, child)=> Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                  height: MediaQuery.of(context).size.height-270,
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount:value.GETVDOECLASSlst==null?0: value.GETVDOECLASSlst.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          _controller.pause();
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(url: "${value.GETVDOECLASSlst[index]}"),));
                      },
                      child: Card(
                        elevation: 0.8,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:AssetImage("assets/Icons/videoicon.png"),fit: BoxFit.cover)
                                ),
                              ),
                            ),
                            CustomText(text: "Class ${index+1}", fontSize: 18, fontWeight: FontWeight.w500)
                          ],
                        )
                      // child: Container(
                      // decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10)
                      // ,
                      // color: listColors[index % listColors.length],
                      // ),
                      // height: 70,
                      // padding: const EdgeInsets.all(8.0),
                      // child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // children: [
                      // Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // children: [
                      // //   CustomText(text: "Package: ${value.getAllPackageList[index]["subscription_structure_id"]??0}",text_color: main_text_blac_color ,fontSize: 12, fontWeight: FontWeight.w500),
                      // Spacer(),
                      // Container(
                      // height: 25,
                      // width: 80,
                      // decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(15),
                      // // gradient: customBackground()
                      // ),
                      // alignment: Alignment.center,
                      // // child: CustomText(text: "\£ ${value.GETVDOECLASSlst[index]}",text_color: main_text_white_color ,fontSize: 17, fontWeight: FontWeight.w500),
                      // ),
                      // ],
                      // ),
                      // CustomText(maxLines:1, text: "Class ${index+1}", fontSize: 18, fontWeight: FontWeight.w500)
                      // // ,
                      // // SizedBox(height: 5,),
                      // // CustomText(text: "Package ${value.getAllPackageList[index]["subscription_structure_id"]??"0"}", fontSize: 16, fontWeight: FontWeight.w500)
                      // ,SizedBox(height: 10,),
                      // InkWell(
                      // onTap: () {
                      //
                      // },
                      // child: Card(
                      // elevation: 9,
                      // child: Container(
                      // height: 36,
                      // width: double.infinity,
                      // decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(
                      // 6
                      // ),
                      // gradient: customBackground(),
                      // ),
                      // alignment: Alignment.center,
                      // child: CustomText(text: "Play Now", fontSize: 16, fontWeight: FontWeight.w700,text_color: Main_Theme_white,),
                      // ),
                      // ),
                      // ),
                      // // Image.asset("assets/Gif/buynow.webp",height: 40,width: 100,fit: BoxFit.fill,)
                      //
                      // ],
                      // ),
                      // ),
                      ),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),),
                ),
              )
      
            ],
          ),
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