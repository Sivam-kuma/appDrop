import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../models/video_model.dart';

class VideoWidget extends StatefulWidget {
  final VideoModel model;
  const VideoWidget({super.key, required this.model});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();

    final url = Uri.parse(widget.model.url);

    controller = VideoPlayerController.networkUrl(url)
      ..initialize().then((_) {
        setState(() => isReady = true);

        if (widget.model.autoPlay) controller.play();

        controller.setLooping(widget.model.loop);

        // Update UI every second for time text
        controller.addListener(() {
          if (mounted) setState(() {});
        });
      });
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.model.padding),
      child: Container(
        height: widget.model.height,
        color: Colors.black,
        child: isReady
            ? Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),

                  // Play / Pause Button
                  GestureDetector(
                    onTap: () {
                      controller.value.isPlaying
                          ? controller.pause()
                          : controller.play();

                      setState(() {});
                    },
                    child: Icon(
                      controller.value.isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill,
                      color: Colors.grey,
                      size: 60,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 6),
                      child: Text(
                        "${formatTime(controller.value.position)} / "
                            "${formatTime(controller.value.duration)}",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: VideoProgressIndicator(
                      controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                        playedColor: Colors.grey,
                        bufferedColor: Colors.white24,
                        backgroundColor: Colors.white10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
            : Center(
          child: CircularProgressIndicator(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
