import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  VideoPlayerController? videoPlayerController;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  final String baseUrl = "http://192.168.1.8:8000/courses/vidioStream";

  Future<void> initializeVideoPlayer(String videoId) async {
    try {
      isLoading(true);
      errorMessage('');

      final videoUrl = '$baseUrl/$videoId';

      // Verify URL exists
      final response = await http.head(Uri.parse(videoUrl));
      print('\n\n\n\n helllosadasdasd${response.statusCode != 200}\n');
      if (response.statusCode == 200) {
        // print('\n\n\n\n helllosadasdasd${response.statusCode != 200}\n');

        throw Exception('Video not found');
      }
      videoPlayerController?.dispose();
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
        ..initialize().then((_) {
          update();
          videoPlayerController!.play();
        });
    } catch (e) {
      print(errorMessage(e.toString()));
      errorMessage(e.toString());
      videoPlayerController?.dispose();
    } finally {
      isLoading(false);
    }
  }

  void togglePlayPause() {
    if (videoPlayerController!.value.isPlaying) {
      videoPlayerController!.pause();
    } else {
      videoPlayerController!.play();
    }
    update();
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }
}