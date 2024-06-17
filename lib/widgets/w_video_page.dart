import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_app/widgets/w_video_player.dart';

class VideoPage extends ConsumerStatefulWidget {
  const VideoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends ConsumerState<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: const Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 10,
                    child: VideoPlayer(),
                  ),
                  Expanded(child: Placeholder()),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
