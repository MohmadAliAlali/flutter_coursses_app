

import 'package:flutter/material.dart';


class WelcomeWidget extends StatelessWidget {

  final String text;


  const WelcomeWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Text(
            'Hello, $text',
          ),
          const SizedBox(
            width: 188,
          ),
          Image.asset('assets/images/icons/notefication.png',
              width: 24, height: 24)
        ],
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
// import 'dart:io';
//
// class VideoPlayerWithThumbnail extends StatefulWidget {
//   final String videoPath; // المسار إلى الفيديو
//
//   const VideoPlayerWithThumbnail({Key? key, required this.videoPath}) : super(key: key);
//
//   @override
//   _VideoPlayerWithThumbnailState createState() => _VideoPlayerWithThumbnailState();
// }
//
// class _VideoPlayerWithThumbnailState extends State<VideoPlayerWithThumbnail> {
//   late VideoPlayerController _videoPlayerController;
//   bool _isPlaying = false;
//   String? _thumbnailPath;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer();
//     _generateThumbnail();
//   }
//
//   // تهيئة مشغل الفيديو
//   void _initializeVideoPlayer() {
//     _videoPlayerController = VideoPlayerController.file(File(widget.videoPath))
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }
//
//   // إنشاء الصورة التعريفية (thumbnail) للفيديو
//   Future<void> _generateThumbnail() async {
//     final thumbnailPath = await VideoThumbnail.thumbnailFile(
//       video: widget.videoPath,
//       imageFormat: ImageFormat.PNG,
//       maxHeight: 200, // ضبط ارتفاع الصورة التعريفية
//       quality: 75,
//     );
//
//     setState(() {
//       _thumbnailPath = thumbnailPath;
//     });
//   }
//
//   // التبديل بين تشغيل الفيديو وإيقافه
//   void _togglePlayPause() {
//     setState(() {
//       if (_videoPlayerController.value.isPlaying) {
//         _videoPlayerController.pause();
//         _isPlaying = false;
//       } else {
//         _videoPlayerController.play();
//         _isPlaying = true;
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // إذا كانت الصورة التعريفية موجودة
//         if (_thumbnailPath != null && !_isPlaying)
//           GestureDetector(
//             onTap: _togglePlayPause,
//             child: Image.file(
//               File(_thumbnailPath!),
//               fit: BoxFit.cover,
//             ),
//           ),
//         // عرض الفيديو عند التشغيل
//         if (_isPlaying || _videoPlayerController.value.isInitialized)
//           AspectRatio(
//             aspectRatio: _videoPlayerController.value.aspectRatio,
//             child: VideoPlayer(_videoPlayerController),
//           ),
//         if (_isPlaying)
//           IconButton(
//             icon: Icon(_videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow),
//             onPressed: _togglePlayPause,
//           ),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'video_player_with_thumbnail.dart'; // استورد ملف الفيديو الخاص بك
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('عرض الفيديو')),
//         body: Center(
//           child: VideoPlayerWithThumbnail(
//             videoPath: 'assets/video/sample_video.mp4', // مسار الفيديو
//           ),
//         ),
//       ),
//     );
//   }
// }

// Column(
// children: List.generate(10, (index) {
// return ListTile(
// leading: Icon(Icons.book),
// title: Text('Subject ${index + 1}'),
// subtitle: Text('Details about Subject ${index + 1}'),
// );
// }),