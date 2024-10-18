import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/profile_controller.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_appbar.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/VideoClassScreen/VideoListScreen/video_list_screen.dart';
import 'package:video_player/video_player.dart';

import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../custom_const.dart';

// class VideoClassScreen extends StatelessWidget {
//   const VideoClassScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Video Player Demo',
//       home: VideoPlayerScreen(),
//     );
//   }
// }
//
// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key});
//
//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     );
//
//     // Initialize the controller and store the Future for later use.
//     _initializeVideoPlayerFuture = _controller.initialize();
//
//     // Use the controller to loop the video.
//     _controller.setLooping(true);
//   }
//
//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Butterfly Video'),
//       ),
//       // Use a FutureBuilder to display a loading spinner while waiting for the
//       // VideoPlayerController to finish initializing.
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the VideoPlayerController has finished initialization, use
//             // the data it provides to limit the aspect ratio of the video.
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               // Use the VideoPlayer widget to display the video.
//               child: InkWell(
//                   onTap: (){
//                     setState(() {
//                       // If the video is playing, pause it.
//                       if (_controller.value.isPlaying) {
//                         _controller.pause();
//                       } else {
//                         // If the video is paused, play it.
//                         _controller.play();
//                       }
//                     });
//                   },
//                   child: VideoPlayer(_controller)),
//             );
//           } else {
//             // If the VideoPlayerController is still initializing, show a
//             // loading spinner.
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }



//
// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// /// Homepage
// class VideoClassScreen extends StatefulWidget {
//   @override
//   _VideoClassScreenState createState() => _VideoClassScreenState();
// }
//
// class _VideoClassScreenState extends State<VideoClassScreen> {
//   late YoutubePlayerController _controller;
//   late TextEditingController _idController;
//   late TextEditingController _seekToController;
//
//   late PlayerState _playerState;
//   late YoutubeMetaData _videoMetaData;
//   bool _isPlayerReady = false;
//
//   final List<String> _ids = [
//     '7Gcep2SUHew',
//     'iLnmTe5Q2Qw',
//     '_WoCV4c6XOE',
//     'KmzdUe0RSJo',
//     '6jZDSSZZxjQ',
//     'p2lYr3vM_1w',
//     '7QUtEmBT_-w',
//     '34_PXCzGw1M',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: _ids.first,
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )..addListener(listener);
//     _idController = TextEditingController();
//     _seekToController = TextEditingController();
//     _videoMetaData = const YoutubeMetaData();
//     _playerState = PlayerState.unknown;
//   }
//
//   void listener() {
//     if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//       setState(() {
//         _playerState = _controller.value.playerState;
//         _videoMetaData = _controller.metadata;
//       });
//     }
//   }
//
//   @override
//   void deactivate() {
//     // Pauses video while navigating to next page.
//     _controller.pause();
//     super.deactivate();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _idController.dispose();
//     _seekToController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//       onExitFullScreen: () {
//         // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
//         SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//       },
//       player: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//         progressIndicatorColor: Colors.blueAccent,
//         topActions: <Widget>[
//           const SizedBox(width: 8.0),
//           Expanded(
//             child: Text(
//               _controller.metadata.title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//               ),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.settings,
//               color: Colors.white,
//               size: 25.0,
//             ),
//             onPressed: () {
//               log('Settings Tapped!');
//             },
//           ),
//         ],
//         onReady: () {
//           _isPlayerReady = true;
//         },
//         onEnded: (data) {
//           _controller
//               .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
//           _showSnackBar('Next Video Started!');
//         },
//       ),
//       builder: (context, player) => Scaffold(
//         appBar: AppBar(
//           leading: Padding(
//             padding: const EdgeInsets.only(left: 12.0),
//             child: Image.asset(
//               'assets/ypf.png',
//               fit: BoxFit.fitWidth,
//             ),
//           ),
//           title: const Text(
//             'Youtube Player Flutter',
//             style: TextStyle(color: Colors.white),
//           ),
//           actions: [
//             IconButton(
//                 icon: const Icon(Icons.video_library),
//
//                 onPressed: ()  {}
//             ),
//           ],
//         ),
//         body: ListView(
//           children: [
//             player,
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   _space,
//                   _text('Title', _videoMetaData.title),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _text(String title, String value) {
//     return RichText(
//       text: TextSpan(
//         text: '$title : ',
//         style: const TextStyle(
//           color: Colors.blueAccent,
//           fontWeight: FontWeight.bold,
//         ),
//         children: [
//           TextSpan(
//             text: value,
//             style: const TextStyle(
//               color: Colors.blueAccent,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget get _space => const SizedBox(height: 10);
//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontWeight: FontWeight.w300,
//             fontSize: 16.0,
//           ),
//         ),
//         backgroundColor: Colors.blueAccent,
//         behavior: SnackBarBehavior.floating,
//         elevation: 1.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50.0),
//         ),
//       ),
//     );
//   }
// }


class VdeoClassLst extends StatefulWidget {
  const VdeoClassLst({super.key});

  @override
  State<VdeoClassLst> createState() => _VdeoClassLstState();
}

class _VdeoClassLstState extends State<VdeoClassLst> {
  @override
  void initState() {
    Provider.of<ProfileController>(context,listen: false).GETVDOECLASSlstProvder(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize:Size.fromHeight(60), child: CustomAppbar()),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back,size: 30,color: BootomBarColor),
          onPressed: () => Navigator.pop(context),),
      body:   Consumer<ProfileController>(
        builder: (context, value, child)=> Container(
          padding: EdgeInsets.only(left: 10,right: 10,top: 10),
          height: double.infinity,
          width: double.infinity,
          child: GridView.builder(
            itemCount:value.GETVDOECLASSlst==null?0: value.GETVDOECLASSlst.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
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

    );
  }
}
