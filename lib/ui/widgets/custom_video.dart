import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:project_stud/controllers/video_controller.dart';

class VideoPlayerScreen extends StatelessWidget {
  final VideoController controller = Get.put(VideoController());
  final TextEditingController videoIdController = TextEditingController();

  VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Django Video Player'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: videoIdController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Video ID',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => controller.initializeVideoPlayer(videoIdController.text),
                  child: const Text('Load Video'),
                ),
              ],
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.errorMessage.isNotEmpty) {
              return Center(child: Text(controller.errorMessage.value));
            }

            return _buildVideoPlayer();
          }),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return GetBuilder<VideoController>(
      builder: (controller) {
        if (controller.videoPlayerController == null ||
            !controller.videoPlayerController!.value.isInitialized) {
          return const AspectRatio(
            aspectRatio: 16 / 9,
            child: Center(child: Text('Enter Video ID to load content')),
          );
        }

        return AspectRatio(
          aspectRatio: controller.videoPlayerController!.value.aspectRatio,
          child: Stack(
            alignment: Alignment.center,
            children: [
              VideoPlayer(controller.videoPlayerController!),
              _buildPlayPauseButton(),
              _buildPositionIndicator(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPlayPauseButton() {
    return GetBuilder<VideoController>(
      builder: (controller) {
        return IconButton(
          icon: Icon(
            controller.videoPlayerController!.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
            size: 50,
            color: Colors.white,
          ),
          onPressed: controller.togglePlayPause,
        );
      },
    );
  }

  Widget _buildPositionIndicator() {
    return GetBuilder<VideoController>(
      builder: (controller) {
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: VideoProgressIndicator(
            controller.videoPlayerController!,
            allowScrubbing: true,
            colors: const VideoProgressColors(
              playedColor: Colors.red,
              bufferedColor: Colors.grey,
              backgroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}