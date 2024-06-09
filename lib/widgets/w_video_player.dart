import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:media_kit/media_kit.dart";
import "package:media_kit_video/media_kit_video.dart";

class VideoPlayer extends ConsumerStatefulWidget {
  const VideoPlayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends ConsumerState<VideoPlayer> {
  late final Player player = Player();
  late final VideoController controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media("asset:///assets/videos/test.mp4"));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 450,
      child: Video(controller: controller),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
